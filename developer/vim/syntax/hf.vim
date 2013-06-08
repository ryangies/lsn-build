" Vim syntax file
" Language:     Hashfile (*.hf)
" Maintainer:   ryangies@livesite.net
" URL:          http://www.livesite.org
" Modified:     2006 May 10

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

  syn match     hfComment   "^\s*#.*"
  syn region    hfComment   start=+^\s*#{+  end=+^\s*#}+
  syn match     hfCtl       "^\s*[\@\$\%]"
  syn match     hfCtl       "{$"
  syn match     hfCtl       "^\s*}$"
  syn match     hfCtl       "=[=>]"
  syn cluster   hfDecor     contains=hfCtl,hfConstant
  syn match     hfVarname   "\s*[\@\%\$][a-zA-Z0-9_\-\.]*\s*{" contains=hfValue,@hfDecor,hfError skipwhite 
  syn match     hfSliceKey  "[^#]\+\s\+=[=>]" contains=@hfDecor skipwhite
  syn match     hfConstant  "\<\.[a-zA-Z0-9_\-\.]\+" contained
  syn region    hfVar       start=+<#+  end=+>+
  syn region    hfVar       start=+\[+  end=+\]+
  syn match     hfText      "\w\+" contained
  syn match     hfError     "\w\+ \+$" contains=hfText contained

" Uncomment if you want to have HTML syntax inside scalar values.
" syn include @Html syntax/html.vim
" syn cluster   hfData      contains=hfVar,@Html
" syn region    hfValue     start=+{+   end=+}+ contains=@hfData

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_hf_syntax_inits")
  if version < 508
    let did_hf_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink hfCtl          Operator
  HiLink hfVar          Type
  HiLink hfComment      Comment
  HiLink hfVarname      Identifier
  HiLink hfSliceKey     Identifier
  HiLink hfConstant     Constant
  HiLink hfError        Error

  delcommand HiLink
endif

let b:current_syntax = "hf"

" vim: ts=8
