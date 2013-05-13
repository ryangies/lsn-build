#!/usr/bin/perl -w
#vim: syntax=perl
use strict;
use warnings;

our $result;
use Test::More tests => [#tcount];

[#:for (t) in testcases]
[#:use t]
ok([#invert ? '!' : '']&t[#num], '[#summary]');
[#:end use]
[#:end for]

[#:for (t) in testcases]
[#:use t]
[#./case_[#comparator].pl]
[#:end use]
[#:end for]
