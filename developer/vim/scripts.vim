if did_filetype()	" filetype already set..
  finish		" ..don't do these checks
endif
if getline(1) =~ '^#\s*PerlModule\>'
  setfiletype perl
elseif getline(1) =~? '^#\s*HashFile\>'
  setfiletype hf
endif
