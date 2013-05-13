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
  dir_create $self->{'out_path'};
  if (my $dir_list = $self->{'spec'}->get('dir_copy')) {
    $dir_list->iterate(sub {
      my ($dest, $src) = @_;
        my $dir = $$self{'hub'}->get($src) or die "$!: $src";
        dir_copy $dir->get_path, $self->{'out_path'} . "/$dest";
    });
  }
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

1;
