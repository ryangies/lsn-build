" Vim syntax file
" Language:	CSS with Hub parser directives
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
  let main_syntax = 'css'
endif
runtime! syntax/css.vim
runtime! syntax/hubparse.vim
let b:current_syntax = "css"
if main_syntax == 'css'
  unlet main_syntax
endif
