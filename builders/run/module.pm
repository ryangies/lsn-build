# PerlModule
use strict;
use warnings FATAL => qw(all);
use Perl::Module;
use Data::Hub;
use Data::Hub::Util qw(:all);

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
  my $out_path = $self->{'out_path'};
  my $src_path = $self->{'spec'}{'src_dir'};

  my $src_dir = $$self{'hub'}->get($src_path) or die "Missing source directory: $src_path";
  dir_copy_contents $src_dir->get_path, $out_path;
  if (-e "$out_path/install") {
    my $common_functions = $$self{'common_dir'}->get('functions')
      or die "Common functions not found";
    file_copy $common_functions->get_path, "$out_path/install";
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

}

sub dist {
  my $self = shift;
  my $out_path = $self->{'out_path'};
  my $out_base_path = $self->{'out_base_path'};
  my $cname = $self->{'cname'};
  my $dist_fn_txt = "$out_base_path/$cname.sh";
  my $dist_fn = "$out_base_path/$cname.run";
  my $skel = $self->{'builder_path'} . "/templates/linux-x86.run";
  my $subdir = path_name($out_path);
  my $rundir = path_parent($out_path);
  my @entries = dir_read($out_path);
  my $tar_cmd = join ' ', 'tar', '--create', '--gzip', "--directory=$out_path", @entries;

  # Copy the generic run script to create the dist target
  file_copy($skel, $dist_fn_txt);

  # Determine how many lines of script need to be skipped
  my ($lines) = `wc -l "$dist_fn_txt"` =~ /^(\d+)/;

  # Recognize file-system changes
  $$self{'hub'}->expire;

  # Populate run script variables
  my $vars =  {
    ctx => {
      version => $self->{'version'},
      skip => $lines + 1,
    },
    props => $self->{'spec'},
  };

  $self->_file_populate($dist_fn_txt, $vars); # must be a text for parsing

  # Now move the text file (.sh) to the "binary" file (.run)
  file_move($dist_fn_txt, $dist_fn);

  # Make it executable
  chmod 0755, $dist_fn;

  # Append the tarball
  open RESULT, ">> $dist_fn" or die $!;
  open CMDOUT, "$tar_cmd |" or die $!;
    while (read CMDOUT, my $buf, 1024) {
      print RESULT $buf;
    }
  close CMDOUT;
  close RESULT;

  # Output
  $self->{'dist_fn'} = $dist_fn;
}

# ------------------------------------------------------------------------------
# upload - Upload the current distribution
# ------------------------------------------------------------------------------

sub upload {
  my $self = shift;
  my $opts = my_opts(\@_);
  my $out_path = $self->{'out_base_path'};
  my $cname = $self->{'cname'};
  my $dist_fn = "$out_path/$cname.run";
  if (-e $dist_fn) {
    my $upload_path = $$self{'spec'}{'upload_path'} or die 'No upload path';
    my $upload_cmd = $$self{'spec'}{'upload_cmd'} or die 'No upload command';
    warn "$dist_fn -> $upload_path\n";
    system $upload_cmd, $dist_fn, $upload_path;
  } else {
    warn "Cannot upload: missing distribution file: $dist_fn\n";
  }
}

# ------------------------------------------------------------------------------
# _file_populate - Parse the given file and write output back to the file
# _file_populate $path
# ------------------------------------------------------------------------------

sub _file_populate {
  my $self = shift;
  my $path = shift or return;
  my $text = file_read($path);
  warn "Parsing: $path\n";
	my $out = $self->{'parser'}->compile_text($text, @_);
  die unless $$out;
  chomp $$out; $$out .= "\n";
  file_write($path, $out);
}

1;
