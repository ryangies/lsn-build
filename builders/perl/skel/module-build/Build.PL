use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => '[#target]',
    license             => '[#props/license]',
    dist_author         => 'Ryan Gies <ryangies@cpan.org>',
    dist_version        => '[#lib_version]',
    [#:if props/perl-xs]
    build_requires      => {
      'ExtUtils::CBuilder' => 0,
    },
    [#:end if]
    requires => {
      'perl' => '5.8.0',
      'Test::More' => 0,
      'version' => 0,
      [#:for (name,ver) in props/depends]
      '[#name]' => [#ver],
      [#:end for]
    },
    # TODO scripts/*
    # TODO add_to_cleanup      => [ 'Algorithm-KeyGen-*' ],
);

$builder->create_build_script();
