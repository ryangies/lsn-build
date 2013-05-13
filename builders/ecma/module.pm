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
# compile - Populate the output directory with all the files.
# ------------------------------------------------------------------------------

sub compile {
  my $self = shift;
  warn "Not implemented\n";
}

# ------------------------------------------------------------------------------
# dist - Create the distribution file (tarball) of the output diretory
# ------------------------------------------------------------------------------

sub dist {
  my $self = shift;
  warn "Not implemented\n";
}

1;
