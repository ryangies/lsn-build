lsn-build
=========

Build tool which compiles and distributes lsn- projects

Mac OS X Version 10.8.5
=======================

    brew install coreutils
    brew install nginx
    brew install libgd
    curl -L http://cpanmin.us | perl - --sudo App::cpanminus

    # Install perl prerequisites (below), then

    cd ~/lsn/lsn-javascript/src/bin
    make lsn-jsmin.c


Prerequisites
=============

    cd ~/lsn/livesite/out/livesite-d28/install
    perl prerequisites.pl
    # sudo cpanm ... (see the output of prerequisites.pl)

    SEAL2467 giesr ~/lsn/lsn-javascript/src/bin
    $ gcc lsn-jsmin.c -o lsn-jsmin
    lsn-jsmin.c:187:60: warning: data argument not used by format string [-Wformat-extra-args]
    "Error: JSMIN unterminated Regular Expression literal.\n", theA);
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
    1 warning generated.

    !
    ! Can't write to /Library/Perl/5.12 and /usr/local/bin: Installing modules to /Users/giesr/perl5
    ! To turn off this warning, you have to do one of the following:
    !   - run me as a root or with --sudo option (to install to /Library/Perl/5.12 and /usr/local/bin)
    !   - Configure local::lib your existing local::lib in this shell to set PERL_MM_OPT etc.
    !   - Install local::lib by running the following commands
    !
    !         cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
    !
    YAML is up to date. (0.84)
    --> Working on Apache2::Request
    Fetching http://www.cpan.org/authors/id/I/IS/ISAAC/libapreq2-2.13.tar.gz ... OK
    Configuring libapreq2-2.13 ... OK
    Building and testing Apache2::Request ... FAIL
    ! Installing Apache2::Request failed. See /Users/giesr/.cpanm/work/1381783819.62621/build.log for details. Retry with --force to force install it.
    GD is up to date. (2.50)
    ! Finding GD::Image on cpanmetadb failed.
    ! Finding GD::Image () on mirror http://www.cpan.org failed.
    ! Couldn't find module or a distribution GD::Image
    --> Working on Term::Size
    Fetching http://www.cpan.org/authors/id/F/FE/FERREIRA/Term-Size-0.207.tar.gz ... OK
    Configuring Term-Size-0.207 ... OK
    Building and testing Term-Size-0.207 ... OK
    Successfully installed Term-Size-0.207
    --> Working on Time::CTime
    Fetching http://www.cpan.org/authors/id/M/MU/MUIR/modules/Time-ParseDate-2013.0920.tar.gz ... OK
    Configuring Time-ParseDate-2013.0920 ... OK
    Building and testing Time-ParseDate-2013.0920 ... OK
    Successfully installed Time-ParseDate-2013.0920
    --> Working on Math::Symbolic
    Fetching http://www.cpan.org/authors/id/S/SM/SMUELLER/Math-Symbolic-0.612.tar.gz ... OK
    ==> Found dependencies: Module::Build
    --> Working on Module::Build
    Fetching http://www.cpan.org/authors/id/L/LE/LEONT/Module-Build-0.4007.tar.gz ... OK
    Configuring Module-Build-0.4007 ... OK
    ==> Found dependencies: Module::Metadata, Perl::OSType
    --> Working on Module::Metadata
    Fetching http://www.cpan.org/authors/id/E/ET/ETHER/Module-Metadata-1.000019.tar.gz ... OK
    Configuring Module-Metadata-1.000019 ... OK
    Building and testing Module-Metadata-1.000019 ... OK
    Successfully installed Module-Metadata-1.000019
    --> Working on Perl::OSType
    Fetching http://www.cpan.org/authors/id/D/DA/DAGOLDEN/Perl-OSType-1.006.tar.gz ... OK
    Configuring Perl-OSType-1.006 ... OK
    Building and testing Perl-OSType-1.006 ... OK
    Successfully installed Perl-OSType-1.006
    Building and testing Module-Build-0.4007 ... OK
    Successfully installed Module-Build-0.4007 (upgraded from 0.3603)
    Configuring Math-Symbolic-0.612 ... OK
    Building and testing Math-Symbolic-0.612 ... OK
    Successfully installed Math-Symbolic-0.612
    --> Working on JSON::XS
    Fetching http://www.cpan.org/authors/id/M/ML/MLEHMANN/JSON-XS-2.34.tar.gz ... OK
    Configuring JSON-XS-2.34 ... OK
    ==> Found dependencies: common::sense
    --> Working on common::sense
    Fetching http://www.cpan.org/authors/id/M/ML/MLEHMANN/common-sense-3.72.tar.gz ... OK
    Configuring common-sense-3.72 ... OK
    Building and testing common-sense-3.72 ... OK
    Successfully installed common-sense-3.72
    Building and testing JSON-XS-2.34 ... OK
    Successfully installed JSON-XS-2.34
    --> Working on YAML::XS
    Fetching http://www.cpan.org/authors/id/I/IN/INGY/YAML-LibYAML-0.41.tar.gz ... OK
    Configuring YAML-LibYAML-0.41 ... OK
    Building and testing YAML-LibYAML-0.41 ... OK
    Successfully installed YAML-LibYAML-0.41
    --> Working on Image::Size
    Fetching http://www.cpan.org/authors/id/R/RJ/RJRAY/Image-Size-3.232.tar.gz ... OK
    Configuring Image-Size-3.232 ... OK
    Building and testing Image-Size-3.232 ... OK
    Successfully installed Image-Size-3.232
    --> Working on Image::ExifTool
    Fetching http://www.cpan.org/authors/id/E/EX/EXIFTOOL/Image-ExifTool-9.27.tar.gz ... OK
    Configuring Image-ExifTool-9.27 ... OK
    Building and testing Image-ExifTool-9.27 ... OK
    Successfully installed Image-ExifTool-9.27
    --> Working on Crypt::RSA
    Fetching http://www.cpan.org/authors/id/V/VI/VIPUL/Crypt-RSA-1.99.tar.gz ... OK
    Configuring Crypt-RSA-1.97 ... OK
    ==> Found dependencies: Tie::EncryptedHash, Crypt::Blowfish, Crypt::Random, Convert::ASCII::Armour, Crypt::CBC, Math::Pari, Digest::MD2, Class::Loader, Sort::Versions, Data::Buffer, Crypt::Primes
    --> Working on Tie::EncryptedHash
    Fetching http://www.cpan.org/authors/id/V/VI/VIPUL/Tie-EncryptedHash-1.24.tar.gz ... OK
    Configuring Tie-EncryptedHash-1.24 ... OK
    ==> Found dependencies: Crypt::CBC, Crypt::Blowfish, Crypt::DES
    --> Working on Crypt::CBC
    Fetching http://www.cpan.org/authors/id/L/LD/LDS/Crypt-CBC-2.33.tar.gz ... OK
    Configuring Crypt-CBC-2.33 ... OK
    Building and testing Crypt-CBC-2.33 ... OK
    Successfully installed Crypt-CBC-2.33
    --> Working on Crypt::Blowfish
    Fetching http://www.cpan.org/authors/id/D/DP/DPARIS/Crypt-Blowfish-2.14.tar.gz ... OK
    Configuring Crypt-Blowfish-2.14 ... OK
    Building and testing Crypt-Blowfish-2.14 ... OK
    Successfully installed Crypt-Blowfish-2.14
    --> Working on Crypt::DES
    Fetching http://www.cpan.org/authors/id/D/DP/DPARIS/Crypt-DES-2.07.tar.gz ... OK
    Configuring Crypt-DES-2.07 ... OK
    Building and testing Crypt-DES-2.07 ... OK
    Successfully installed Crypt-DES-2.07
    Building and testing Tie-EncryptedHash-1.24 ... OK
    Successfully installed Tie-EncryptedHash-1.24
    --> Working on Crypt::Random
    Fetching http://www.cpan.org/authors/id/V/VI/VIPUL/Crypt-Random-1.25.tar.gz ... OK
    Configuring Crypt-Random-1.25 ... OK
    ==> Found dependencies: Math::Pari, Class::Loader
    --> Working on Math::Pari
    Fetching http://www.cpan.org/authors/id/I/IL/ILYAZ/modules/Math-Pari-2.01080605.tar.gz ... OK
    Configuring Math-Pari-2.01080605 ... OK
    Building and testing Math-Pari-2.01080605 ... OK
    Successfully installed Math-Pari-2.01080605
    --> Working on Class::Loader
    Fetching http://www.cpan.org/authors/id/V/VI/VIPUL/Class-Loader-2.03.tar.gz ... OK
    Configuring Class-Loader-2.03 ... OK
    Building and testing Class-Loader-2.03 ... OK
    Successfully installed Class-Loader-2.03
    Building and testing Crypt-Random-1.25 ... OK
    Successfully installed Crypt-Random-1.25
    --> Working on Convert::ASCII::Armour
    Fetching http://www.cpan.org/authors/id/V/VI/VIPUL/Convert-ASCII-Armour-1.4.tar.gz ... OK
    Configuring Convert-ASCII-Armour-1.4 ... OK
    Building and testing Convert-ASCII-Armour-1.4 ... OK
    Successfully installed Convert-ASCII-Armour-1.4
    --> Working on Digest::MD2
    Fetching http://www.cpan.org/authors/id/G/GA/GAAS/Digest-MD2-2.03.tar.gz ... OK
    Configuring Digest-MD2-2.03 ... OK
    Building and testing Digest-MD2-2.03 ... OK
    Successfully installed Digest-MD2-2.03
    --> Working on Sort::Versions
    Fetching http://www.cpan.org/authors/id/E/ED/EDAVIS/Sort-Versions-1.5.tar.gz ... OK
    Configuring Sort-Versions-1.5 ... OK
    Building and testing Sort-Versions-1.5 ... OK
    Successfully installed Sort-Versions-1.5
    --> Working on Data::Buffer
    Fetching http://www.cpan.org/authors/id/B/BT/BTROTT/Data-Buffer-0.04.tar.gz ... OK
    Configuring Data-Buffer-0.04 ... OK
    Building and testing Data-Buffer-0.04 ... OK
    Successfully installed Data-Buffer-0.04
    --> Working on Crypt::Primes
    Fetching http://www.cpan.org/authors/id/V/VI/VIPUL/Crypt-Primes-0.50.tar.gz ... OK
    Configuring Crypt-Primes-0.50 ... OK
    Building and testing Crypt-Primes-0.50 ... OK
    Successfully installed Crypt-Primes-0.50
    Building and testing Crypt-RSA-1.97 ... OK
    Successfully installed Crypt-RSA-1.97
    --> Working on Data::UUID
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Data-UUID-1.219.tar.gz ... OK
    Configuring Data-UUID-1.219 ... OK
    Building and testing Data-UUID-1.219 ... OK
    Successfully installed Data-UUID-1.219
    --> Working on DBD::mysql
    Fetching http://www.cpan.org/authors/id/C/CA/CAPTTOFU/DBD-mysql-4.024.tar.gz ... OK
    Configuring DBD-mysql-4.024 ... OK
    Building and testing DBD-mysql-4.024 ... FAIL
    ! Installing DBD::mysql failed. See /Users/giesr/.cpanm/work/1381783819.62621/build.log for details. Retry with --force to force install it.
    --> Working on Net::FTP::File
    Fetching http://www.cpan.org/authors/id/D/DM/DMUEY/Net-FTP-File-0.06.tar.gz ... OK
    Configuring Net-FTP-File-0.06 ... OK
    Building and testing Net-FTP-File-0.06 ... OK
    Successfully installed Net-FTP-File-0.06
    --> Working on Mail::Sender
    Fetching http://www.cpan.org/authors/id/J/JE/JENDA/Mail-Sender-0.8.22.tar.gz ... OK
    Configuring Mail-Sender-0.8.22 ... OK
    Building and testing Mail-Sender-0.8.22 ... OK
    Successfully installed Mail-Sender-0.8.22
    --> Working on File::Type
    Fetching http://www.cpan.org/authors/id/P/PM/PMISON/File-Type-0.22.tar.gz ... OK
    Configuring File-Type-0.22 ... OK
    Building and testing File-Type-0.22 ... OK
    Successfully installed File-Type-0.22
    --> Working on Email::Valid
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-Valid-1.192.tar.gz ... OK
    Configuring Email-Valid-1.192 ... OK
    ==> Found dependencies: Capture::Tiny
    --> Working on Capture::Tiny
    Fetching http://www.cpan.org/authors/id/D/DA/DAGOLDEN/Capture-Tiny-0.22.tar.gz ... OK
    Configuring Capture-Tiny-0.22 ... OK
    Building and testing Capture-Tiny-0.22 ... OK
    Successfully installed Capture-Tiny-0.22
    Building and testing Email-Valid-1.192 ... OK
    Successfully installed Email-Valid-1.192
    --> Working on Email::Simple::Creator
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-Simple-2.202.tar.gz ... OK
    Configuring Email-Simple-2.202 ... OK
    ==> Found dependencies: Email::Date::Format
    --> Working on Email::Date::Format
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-Date-Format-1.004.tar.gz ... OK
    Configuring Email-Date-Format-1.004 ... OK
    Building and testing Email-Date-Format-1.004 ... OK
    Successfully installed Email-Date-Format-1.004
    Building and testing Email-Simple-2.202 ... OK
    Successfully installed Email-Simple-2.202
    --> Working on Email::MIME::Creator
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-MIME-1.924.tar.gz ... OK
    Configuring Email-MIME-1.924 ... OK
    ==> Found dependencies: Email::MessageID, MIME::Types, Email::MIME::Encodings, Email::MIME::ContentType, Email::Address
    --> Working on Email::MessageID
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-MessageID-1.402.tar.gz ... OK
    Configuring Email-MessageID-1.402 ... OK
    ==> Found dependencies: Email::Address
    --> Working on Email::Address
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-Address-1.900.tar.gz ... OK
    Configuring Email-Address-1.900 ... OK
    Building and testing Email-Address-1.900 ... OK
    Successfully installed Email-Address-1.900
    Building and testing Email-MessageID-1.402 ... OK
    Successfully installed Email-MessageID-1.402
    --> Working on MIME::Types
    Fetching http://www.cpan.org/authors/id/M/MA/MARKOV/MIME-Types-2.04.tar.gz ... OK
    Configuring MIME-Types-2.04 ... OK
    Building and testing MIME-Types-2.04 ... OK
    Successfully installed MIME-Types-2.04
    --> Working on Email::MIME::Encodings
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-MIME-Encodings-1.315.tar.gz ... OK
    Configuring Email-MIME-Encodings-1.315 ... OK
    Building and testing Email-MIME-Encodings-1.315 ... OK
    Successfully installed Email-MIME-Encodings-1.315
    --> Working on Email::MIME::ContentType
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-MIME-ContentType-1.017.tar.gz ... OK
    Configuring Email-MIME-ContentType-1.017 ... OK
    Building and testing Email-MIME-ContentType-1.017 ... OK
    Successfully installed Email-MIME-ContentType-1.017
    Building and testing Email-MIME-1.924 ... OK
    Successfully installed Email-MIME-1.924
    --> Working on Email::Sender
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-Sender-1.300006.tar.gz ... OK
    Configuring Email-Sender-1.300006 ... OK
    ==> Found dependencies: Moo::Role, Throwable::Error, Email::Abstract, Moo, MooX::Types::MooseLike
    --> Working on Moo::Role
    Fetching http://www.cpan.org/authors/id/M/MS/MSTROUT/Moo-1.003001.tar.gz ... OK
    Configuring Moo-1.003001 ... OK
    ==> Found dependencies: Devel::GlobalDestruction, strictures, Role::Tiny, Module::Runtime, Class::Method::Modifiers
    --> Working on Devel::GlobalDestruction
    Fetching http://www.cpan.org/authors/id/H/HA/HAARG/Devel-GlobalDestruction-0.11.tar.gz ... OK
    Configuring Devel-GlobalDestruction-0.11 ... OK
    ==> Found dependencies: Sub::Exporter::Progressive, Devel::GlobalDestruction::XS
    --> Working on Sub::Exporter::Progressive
    Fetching http://www.cpan.org/authors/id/F/FR/FREW/Sub-Exporter-Progressive-0.001010.tar.gz ... OK
    Configuring Sub-Exporter-Progressive-0.001010 ... OK
    Building and testing Sub-Exporter-Progressive-0.001010 ... OK
    Successfully installed Sub-Exporter-Progressive-0.001010
    --> Working on Devel::GlobalDestruction::XS
    Fetching http://www.cpan.org/authors/id/R/RI/RIBASUSHI/Devel-GlobalDestruction-XS-0.01.tar.gz ... OK
    Configuring Devel-GlobalDestruction-XS-0.01 ... OK
    Building and testing Devel-GlobalDestruction-XS-0.01 ... OK
    Successfully installed Devel-GlobalDestruction-XS-0.01
    Building and testing Devel-GlobalDestruction-0.11 ... OK
    Successfully installed Devel-GlobalDestruction-0.11 (upgraded from 0.04)
    --> Working on strictures
    Fetching http://www.cpan.org/authors/id/E/ET/ETHER/strictures-1.004004.tar.gz ... OK
    Configuring strictures-1.004004 ... OK
    Building and testing strictures-1.004004 ... OK
    Successfully installed strictures-1.004004
    --> Working on Role::Tiny
    Fetching http://www.cpan.org/authors/id/H/HA/HAARG/Role-Tiny-1.003002.tar.gz ... OK
    Configuring Role-Tiny-1.003002 ... OK
    Building and testing Role-Tiny-1.003002 ... OK
    Successfully installed Role-Tiny-1.003002
    --> Working on Module::Runtime
    Fetching http://www.cpan.org/authors/id/Z/ZE/ZEFRAM/Module-Runtime-0.013.tar.gz ... OK
    Configuring Module-Runtime-0.013 ... OK
    Building and testing Module-Runtime-0.013 ... OK
    Successfully installed Module-Runtime-0.013 (upgraded from 0.011)
    --> Working on Class::Method::Modifiers
    Fetching http://www.cpan.org/authors/id/E/ET/ETHER/Class-Method-Modifiers-2.08.tar.gz ... OK
    ==> Found dependencies: Module::Build::Tiny
    --> Working on Module::Build::Tiny
    Fetching http://www.cpan.org/authors/id/L/LE/LEONT/Module-Build-Tiny-0.030.tar.gz ... OK
    ==> Found dependencies: TAP::Harness::Env, ExtUtils::Helpers, ExtUtils::InstallPaths, TAP::Harness, ExtUtils::Config
    --> Working on TAP::Harness::Env
    Fetching http://www.cpan.org/authors/id/O/OV/OVID/Test-Harness-3.29.tar.gz ... OK
    Configuring Test-Harness-3.29 ... OK
    Building and testing Test-Harness-3.29 ... OK
    Successfully installed Test-Harness-3.29
    --> Working on ExtUtils::Helpers
    Fetching http://www.cpan.org/authors/id/L/LE/LEONT/ExtUtils-Helpers-0.021.tar.gz ... OK
    Configuring ExtUtils-Helpers-0.021 ... OK
    Building and testing ExtUtils-Helpers-0.021 ... OK
    Successfully installed ExtUtils-Helpers-0.021
    --> Working on ExtUtils::InstallPaths
    Fetching http://www.cpan.org/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-0.009.tar.gz ... OK
    Configuring ExtUtils-InstallPaths-0.009 ... OK
    ==> Found dependencies: ExtUtils::Config
    --> Working on ExtUtils::Config
    Fetching http://www.cpan.org/authors/id/L/LE/LEONT/ExtUtils-Config-0.007.tar.gz ... OK
    Configuring ExtUtils-Config-0.007 ... OK
    Building and testing ExtUtils-Config-0.007 ... OK
    Successfully installed ExtUtils-Config-0.007
    Building and testing ExtUtils-InstallPaths-0.009 ... OK
    Successfully installed ExtUtils-InstallPaths-0.009
    Configuring Module-Build-Tiny-0.030 ... OK
    Building and testing Module-Build-Tiny-0.030 ... OK
    Successfully installed Module-Build-Tiny-0.030
    Configuring Class-Method-Modifiers-2.08 ... OK
    Building and testing Class-Method-Modifiers-2.08 ... OK
    Successfully installed Class-Method-Modifiers-2.08
    Building and testing Moo-1.003001 ... OK
    Successfully installed Moo-1.003001
    --> Working on Throwable::Error
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Throwable-0.200008.tar.gz ... OK
    Configuring Throwable-0.200008 ... OK
    ==> Found dependencies: Devel::StackTrace, Class::Load, MooX::Types::MooseLike::Base
    --> Working on Devel::StackTrace
    Fetching http://www.cpan.org/authors/id/D/DR/DROLSKY/Devel-StackTrace-1.30.tar.gz ... OK
    Configuring Devel-StackTrace-1.30 ... OK
    Building and testing Devel-StackTrace-1.30 ... OK
    Successfully installed Devel-StackTrace-1.30
    --> Working on Class::Load
    Fetching http://www.cpan.org/authors/id/D/DR/DROLSKY/Class-Load-0.20.tar.gz ... OK
    Configuring Class-Load-0.20 ... OK
    ==> Found dependencies: Module::Implementation
    --> Working on Module::Implementation
    Fetching http://www.cpan.org/authors/id/D/DR/DROLSKY/Module-Implementation-0.07.tar.gz ... OK
    Configuring Module-Implementation-0.07 ... OK
    Building and testing Module-Implementation-0.07 ... OK
    Successfully installed Module-Implementation-0.07
    Building and testing Class-Load-0.20 ... OK
    Successfully installed Class-Load-0.20 (upgraded from 0.12)
    --> Working on MooX::Types::MooseLike::Base
    Fetching http://www.cpan.org/authors/id/M/MA/MATEU/MooX-Types-MooseLike-0.25.tar.gz ... OK
    Configuring MooX-Types-MooseLike-0.25 ... OK
    Building and testing MooX-Types-MooseLike-0.25 ... OK
    Successfully installed MooX-Types-MooseLike-0.25
    Building and testing Throwable-0.200008 ... OK
    Successfully installed Throwable-0.200008
    --> Working on Email::Abstract
    Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/Email-Abstract-3.006.tar.gz ... OK
    Configuring Email-Abstract-3.006 ... OK
    Building and testing Email-Abstract-3.006 ... OK
    Successfully installed Email-Abstract-3.006
    Building and testing Email-Sender-1.300006 ... OK
    Successfully installed Email-Sender-1.300006
    --> Working on Email::Sender::Transport::SMTP::TLS
    Fetching http://www.cpan.org/authors/id/F/FA/FAYLAND/Email-Sender-Transport-SMTP-TLS-0.14.tar.gz ... OK
    Configuring Email-Sender-Transport-SMTP-TLS-0.14 ... OK
    ==> Found dependencies: Net::SMTP::TLS::ButMaintained
    --> Working on Net::SMTP::TLS::ButMaintained
    Fetching http://www.cpan.org/authors/id/F/FA/FAYLAND/Net-SMTP-TLS-ButMaintained-0.24.tar.gz ... OK
    Configuring Net-SMTP-TLS-ButMaintained-0.24 ... OK
    ==> Found dependencies: IO::Socket::SSL
    --> Working on IO::Socket::SSL
    Fetching http://www.cpan.org/authors/id/S/SU/SULLR/IO-Socket-SSL-1.955.tar.gz ... OK
    Configuring IO-Socket-SSL-1.955 ... OK
    ==> Found dependencies: Net::SSLeay
    --> Working on Net::SSLeay
    Fetching http://www.cpan.org/authors/id/M/MI/MIKEM/Net-SSLeay-1.55.tar.gz ... OK
    Configuring Net-SSLeay-1.53 ... OK
    Building and testing Net-SSLeay-1.53 ... OK
    Successfully installed Net-SSLeay-1.53 (upgraded from 1.42)
    Building and testing IO-Socket-SSL-1.955 ... OK
    Successfully installed IO-Socket-SSL-1.955 (upgraded from 1.49)
    Building and testing Net-SMTP-TLS-ButMaintained-0.24 ... OK
    Successfully installed Net-SMTP-TLS-ButMaintained-0.24
    Building and testing Email-Sender-Transport-SMTP-TLS-0.14 ... OK
    Successfully installed Email-Sender-Transport-SMTP-TLS-0.14
    --> Working on JavaScript::Minifier::XS
    Fetching http://www.cpan.org/authors/id/G/GT/GTERMARS/JavaScript-Minifier-XS-0.09.tar.gz ... OK
    Configuring JavaScript-Minifier-XS-0.09 ... OK
    Building and testing JavaScript-Minifier-XS-0.09 ... OK
    Successfully installed JavaScript-Minifier-XS-0.09
    --> Working on CSS::Minifier::XS
    Fetching http://www.cpan.org/authors/id/G/GT/GTERMARS/CSS-Minifier-XS-0.08.tar.gz ... OK
    Configuring CSS-Minifier-XS-0.08 ... OK
    Building and testing CSS-Minifier-XS-0.08 ... OK
    Successfully installed CSS-Minifier-XS-0.08
    64 distributions installed
