#!/usr/bin/perl
use strict;
use Data::Hub qw($Hub);
use Perl::ModuleInfo;

my $lib_path = shift @ARGV;
my $info = Perl::ModuleInfo->new();

foreach my $path (@ARGV) {
  $info->parse($lib_path, $path);
}

$Hub->set('modinfo.hf', $info)->save();
