#!/usr/bin/perl -w
use strict;

# ------------------------------------------------------------------------------
# THIS IS A GENERATED SCRIPT, CHANGES MADE HERE WILL BE OVERWRITTEN
# ------------------------------------------------------------------------------

[#:for (lib_dir) in lib_dirs]
use lib qw([#lib_dir]);
[#:end for]

use Perl::Module;
use Data::Hub::Util qw(:all);
use Data::Hub qw($Hub);

our %Info = ();
[#:for (ctx,idx,tc) in testcases]
$Info{'t[#ctx/number]'} = [#:dump tc];
[#:end for]

our ($test,$tinfo,$result,$total_tests) = (undef,undef,undef,0);
$$Hub{'/sys/OPTS/v'} = 0 unless defined $$Hub{'/sys/OPTS/v'};
main();

# ------------------------------------------------------------------------------
# main - Test harness
# ------------------------------------------------------------------------------

sub main {
  $test = 1; # start at 1 to match ExtUtils::Command::MM
  my ($pass_count,$fail_count) = (0,0);
  while (eval("defined &t$test")) {
    $tinfo = $Info{"t$test"} or die "Cannot find testcase: $test\n";
    undef $result;
    $total_tests++;
    my $passed = eval( "&t$test()" );
    if( $@ ) {
      $result = $@;
      $passed = 0;
    } else {
      $passed = !$passed if( $$tinfo{'invert'} );
    }
    my $result_str = defined $result ? "'$result'" : 'undef';
    chomp $result_str;
    if( $passed ) {
      $pass_count++;
      printstatus( "passed: $result_str" ) if $$Hub{'/sys/OPTS/v'} > 1;
      printstatus( 'passed' ) if $$Hub{'/sys/OPTS/v'} eq 1;
    } else {
      $fail_count++;
      my $prefix = $result_str =~ /\n/ ? "FAILED:\n" : "FAILED: ";
      printstatus( "$prefix$result_str" );
    }
    $test++;
  }
  print "$pass_count of $total_tests passed.\n";
  exit ($pass_count == $total_tests ? 0 : 1);
}

# ------------------------------------------------------------------------------
# printstatus - Print pass/fail message
# ------------------------------------------------------------------------------

sub printstatus {
  printf "Test [%4d] %-25s line %5d: %s\n",
    $test,
    path_name($$tinfo{'package'}),
    $$tinfo{'lineno'}, @_;
}

[#:for (c,k,v) in testcases]
[#:use v]
[#./case_[#v/comparator].pl]
[#:end use]
[#:end for]
