" Vim syntax file
" Language:	HTML with Hub parser directives
" Maintainer:	Ryan Gies <ryangies@perl.org>
" Last Change: 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'html'
endif
runtime! syntax/html.vim
runtime! syntax/hubparse.vim
let b:current_syntax = "html"

" JavaScript sections
syn include @embeddedJavaScript syntax/hub+javascript.vim
unlet b:current_syntax
syn region javaScript matchgroup=hubWrapper start=+\[#:js\]+ end=+\[#:end js\]+ contains=@embeddedJavaScript,hubIdentify
syn region javaScript matchgroup=hubWrapper start=+\[#:js\s\+\(src\)\@!.*\]+ end=+\[#:end js\]+ contains=@embeddedJavaScript,hubIdentify
syn region javaScript matchgroup=hubWrapper start=+\[#:js:\z([a-z]\+\).*\]+ end=+\[#:end js:\z1\]+ contains=@embeddedJavaScript,hubIdentify

" Supress the "Special" highlighting assigned to js by html.vim
hi link javaScript Normal

" StyleSheet sections
syn include @embeddedCss syntax/hub+css.vim
unlet b:current_syntax
syn region cssStyle matchgroup=hubWrapper start=+\[#:css\]+ end=+\[#:end css\]+ contains=@embeddedCss,hubIdentify
syn region cssStyle matchgroup=hubWrapper start=+\[#:css\s\+\(src\)\@!.*\]+ end=+\[#:end css\]+ contains=@embeddedCss,hubIdentify
" 
" Can't seem to do lookahead/behind with the start pattern... giving up
"
"syn region cssStyle matchgroup=hubWrapper start=+\[#:css\( \(src\)\@!\)\?\]+ end=+\[#:end css\]+ contains=@embeddedCss,hubIdentify

" No-markup (NML) sections
syn region Normal matchgroup=hubWrapper start=+\[#:nml\([:\s].*\)\?]+ end=+\[#:end nml\]+

if main_syntax == 'html'
  unlet main_syntax
endif
