use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Algorithm::KeyGen',
    AUTHOR              => 'Ryan Gies <ryangies@cpan.org>',
    VERSION_FROM        => 'lib/Algorithm/KeyGen.pm',
    ABSTRACT_FROM       => 'lib/Algorithm/KeyGen.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'version'    => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Algorithm-KeyGen-*' },
);
