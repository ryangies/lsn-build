use 5.008003;
use inc::Module::Install;

name '[#target]';

abstract '[#props/abstract]';
author 'Ryan Gies <ryangies@cpan.org>';
version '[#lib_version]';
license '[#props/license]';

perl_version 5.008003;
test_requires 'Test::More' => '0.42';
[#:for (name,ver) in props/depends]
test_requires '[#name]' => [#ver];
[#:end for]

[#:for (name,ver) in props/depends]
requires '[#name]' => [#ver];
[#:end for]

[#:for (name,file) in "./scripts"]
install_script 'scripts/[#name]';
[#:end for]

install_as_vendor;
WriteAll;
