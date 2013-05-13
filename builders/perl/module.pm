# PerlModule
use strict;
use warnings FATAL => qw(all);
use Perl::Module;
use Data::Hub;
use Data::Hub::Util qw(:all);
use Parse::Template::Standard;
use Perl::ModuleInfo;
use Pod::Html;

# ------------------------------------------------------------------------------
# new - Constructor
# new @vars
# ------------------------------------------------------------------------------

sub new {
  my $class = ref($_[0]) ? ref(shift) : shift;
  my $self = bless {@_}, $class;
  $self;
}

# ------------------------------------------------------------------------------
# compile - Create the distribution files
# compile
# ------------------------------------------------------------------------------

sub compile {
  my $self = shift;

  my $out_path = $self->{out_path};
  my $root = $self->{proj_path};
  my $work_path = $self->{work_path};
  my $src_dir = $self->{spec}{'src_dir'};
  my $src_files = $self->{spec}{'src_files'};
  my $scripts = $self->{spec}{'scripts'};
  my $skel = $self->{spec}{'skel'} || 'module-install';

  # Seed the output directory
  dir_copy "$work_path/skel/$skel", $out_path;

  # Special case when src_files is 'ALL'
  if (!ref($src_files)) {
    if ($src_files eq 'ALL') {
      $src_files = [];
      my $subset = $$self{'hub'}->get($src_dir . '/**/*.pm');
      foreach my $path ($subset->keys) {
        next if $path =~ /Testing/;
        push @$src_files, $path;
      }
    } else {
      die 'cannot process src_files list';
    }
  }

  # Copy source modules to lib directory
  foreach my $path (@$src_files) {
    my $paddr = path_parent($path);
    my $subdir = path_normalize("$out_path/lib/$paddr");
    dir_create $subdir;
    file_copy "$root/$src_dir/$path", $subdir;
  }

  # Copy additional items
  if (my $includes = $self->{'spec'}{'include'}) {
    foreach my $inc (@$includes) {
      my $dest = $$inc{'dest'} || '';
      my $dirs = $$inc{'dirs'} || [];
      my $files = $$inc{'files'} || [];
      my $subdir = path_normalize("$out_path/$dest");
      dir_create $subdir;
      for (@$files) {
        my $file = $$self{'hub'}->get($_) or die "Missing source file: $_";
        file_copy $file->get_path, $subdir;
      }
      for (@$dirs) {
        my $dir = $$self{'hub'}->get($_) or die "Missing source directory: $_";
        dir_copy $dir->get_path, $subdir;
      }
    }
  }

  # Copy runtime scripts
  if ($scripts && @$scripts) {
    dir_create "$out_path/scripts";
    my $mode = 0755;
    for (@$scripts) {
      my $fn = path_name($_);
      file_copy("$root/$_", "$out_path/scripts");
      chmod $mode, "$out_path/scripts/$fn";
    }
  }

  # Recognize file-system changes
  $$self{'hub'}->expire;

  # Build 
  $self->_build_docs_and_tests($src_files);

  # Populate templated files
  $$self{'hub'}->expire;
  my $ctx_vars =  {
    props => $self->{spec},
    lib_version => $self->{version},
    target => $self->{name},
    out_dir => $out_path,
  };

  $self->_file_populate("$out_path/MANIFEST", $ctx_vars);
  $self->_file_populate("$out_path/README", $ctx_vars);
  $self->_file_populate("$out_path/Makefile.PL", $ctx_vars);

}

# ------------------------------------------------------------------------------
# dist - Take the compiled output and make a distribution file (tarball)
# ------------------------------------------------------------------------------

sub dist {
  my $self = shift;
  if (-d $self->{'out_path'}) {
    my $dir = path_parent($self->{'out_path'});
    my $name = path_name($self->{'cname'});
    my $dist_fn = sprintf '%s/%s.tgz', $self->{'out_base_path'}, $name;
    system 'tar', '--create', '--gzip', "--file=$dist_fn", 
      "--directory=$dir", $name;
    $self->{'dist_fn'} = $dist_fn; # also indicates success
  }
}

# ------------------------------------------------------------------------------

sub _build_docs_and_tests {

  my $self = shift;
  my $src_files = shift;
  my $out_path = $self->{out_path};
  my $out_addr = $$self{'hub'}->path_to_addr($out_path);
  my $lib = $$self{'hub'}->get("$out_addr/lib") or die "Missing: $out_addr/lib\n";

  my $lib_path = $lib->get_path;
  my $info = Perl::ModuleInfo->new();

  foreach my $path (@$src_files) {
    $info->parse($lib_path, $path);
  }

  $$self{'hub'}->set('modinfo.hf', $info)->save();

  $$self{'hub'}->expire;

  my $tests = $info->{tests};
  my $docs = $info->{docs};

  # Setup the POD parser.  In the ./pod directory there are
  # templates for building the .pod file, and uses information parsed
  # by Perl::ModuleInfo.
  my $pod_out = '';
  my $pod_parser = Parse::Template::Standard->new($$self{'hub'},
    -begin => '{#',
    -end => '}',
    -out => \$pod_out,
  );
  $pod_parser->set_directive('pod', {
    indent => [sub {
      my ($parser, $name, $addr, $len) = @_;
      my $value = $parser->get_compiled_value(\$addr);
      return unless defined $value;
      $parser->get_ctx->{collapse} = 0;
      my $prefix = ' ' x $len;
      if (!ref($value)) {
        $value =~ s/^(.*)$/$prefix$1/gm;
      }
      $value;
    }],
  });

  my $doc_dir = $self->{proj_path} . '/src/doc/lib/perl';

  $info->get('docs')->iterate(sub {
    my ($idx, $pkg) = @_;
    $pod_out = '';
    my $pn = $pkg->{name};
    $pn =~ s/::/-/g;
    my $fn = $pkg->{name};
    $fn =~ s/::/\//g;
    $pod_parser->compile("./pod/package.pod", $pkg);
    $$self{'hub'}->set("$out_addr/lib/$fn.pod", $pod_out)->save();
    _pod2html("$out_path/lib/$fn.pod", "$doc_dir/$pn.html", $pkg->{name});
  });

  # Cleanup temporary files
  file_remove("pod2htmd.tmp");
  file_remove("pod2htmi.tmp");
  file_remove("modinfo.hf");

  # Set up a template parser
  my $vars = { testcases => $tests, lib_dirs => [qw(../lib)], tcount => scalar(@$tests) };

  # Create stand-alone test harness
  {
    my $test_addr = "$out_addr/t/full.pl";
    my $out_str = '';
    $self->{parser}->compile("./test/harness.pl", $vars, -out => \$out_str);
    my $file = $$self{'hub'}->set($test_addr, $out_str)->save();
    chmod 0755, $file->get_path;
    $self->{test_script} = $file->get_path;
  }

  # Create install tests
  {
    my $out_str = '';
    my $out_fn = sprintf '%s/t/full.t', $out_addr;
    $self->{parser}->compile("./test/test-more.t", $vars, -out => \$out_str);
    $$self{'hub'}->set($out_fn, $out_str)->save;
  }

}

sub _pod2html {
  my ($podfn, $htmlfn, $title) = @_;
  my $cssfn = 'styles.css';
  pod2html( 
    '--flush',
    '--backlink=Top',
    "--title=$title",
    "--css=$cssfn",
    "--infile=$podfn",
    "--outfile=$htmlfn"
  );
}

# ------------------------------------------------------------------------------
# _file_populate - Parse the given file and write output back to the file
# _file_populate $path
# ------------------------------------------------------------------------------

sub _file_populate {
  my $self = shift;
  my $path = shift or return;
  my $addr = $$self{'hub'}->path_to_addr($path) or die "Cannot find: $path\n";
	my $out = $self->{parser}->compile($addr, @_);
  die unless $$out;
  chomp $$out; $$out .= "\n";
  file_write($path, $out);
}

1;
