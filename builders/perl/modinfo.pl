#!/usr/bin/perl
use strict;
use Data::Hub;
use Perl::ModuleInfo;
my $out_path = shift @ARGV;
my $lib_path = shift @ARGV;
my $hub = Data::Hub->new($out_path);
my $info = Perl::ModuleInfo->new();
foreach my $path (@ARGV) {
  $info->parse($lib_path, $path);
}
$hub->set('modinfo.yml', $info)->save();
