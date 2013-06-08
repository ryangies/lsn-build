" Vim syntax file
" Language:     Hub parser syntax
" Maintainer:   ryan@livesite.net
" URL:          http://www.livesite.org
" Modified:     Tue Mar 18 08:40:27 PST 2008

let hubparse_debug = 1

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  else
    let main_syntax = 'hubparse'
  endif
endif

" [# ... ]
syn region    hubIdentify             start=+\[#+ end=+\]+ contains=hubWrapper,hubDirective,hubVariable,hubComment
syn region    hubWrapper              start=+\[#:into+ end=+\]+
syn region    hubInclude              start=+\[#:[a-z]\+\s\+src\b+ end=+\]+
syn cluster   hubSugar      contains=hubKeyword,hubLiteral,hubNumber
syn region    hubDirective  contained start=+#:[a-z]+ end=+\]+me=e-1 contains=hubIdentify,@hubSugar
syn region    hubVariable   contained start=+\[#+ms=s+2 end=+\]+me=e-1 contains=hubIdentify,@hubSugar
syn region    hubComment    matchgroup=hubWrapper start=+\[#:comment\]+ end=+\[#:end comment\]+

" Literals
syn region    hubLiteral    contained start=+'+ end=+'+
syn region    hubLiteral    contained start=+`+ end=+`+
syn match     hubNumber     contained "\<[0-9]\+\>"

" Comparators
syn keyword   hubKeyword    contained in as from
syn keyword   hubKeyword    contained eq ne eqic neic gt lt ge le cmp isa
syn match     hubKeyword    contained "=\|\~\|==\|\!=\|>=\|<=\|<\|>"

" Fallbacks
syn match     hubKeyword    contained "&&\|||\|?"

" Syntax
syn match     hubKeyword    contained "{\|}\|=\|(\|)\|,"

" HTML extension: <div [#...] ... >
syn region    htmlTagN      matchgroup=hubWrapper contained start=+\[#+ end=+\]+ contains=@hubSugar

" Hash format sections
if main_syntax != 'hf'
  if exists("b:current_syntax")
    unlet b:current_syntax
  endif
  syn include @embeddedHashdata syntax/hf.vim
  syn region hashFormat matchgroup=hubWrapper start=+__DATA__+ end=+EOF+ contains=@embeddedHashdata
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_hub_syntax_inits")

  if version < 508
    let did_hub_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " For a list of highlight colors, run
  "   :so $VIMRUNTIME/syntax/hitest.vim

  HiLink htmlTagN         PreProc
  HiLink hubWrapper       PreProc
  HiLink hubInclude       PreProc
  HiLink hubIdentify      PreProc
  HiLink hubDirective     PreProc
  HiLink hubVariable      Identifier
  HiLink hubKeyword       Statement
  HiLink hubLiteral       String
  HiLink hubNumber        Number
  HiLink hubComment       Comment

  delcommand HiLink
endif

let b:current_syntax = "hubparse"
