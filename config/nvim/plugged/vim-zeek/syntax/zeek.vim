" Vim syntax file
" Language: Zeek (https://zeek.org)
" Author: Jon Siwek

if exists("b:current_syntax")
  finish
endif

syn match zeekComment /#.*/ contains=zeekTodo
syn keyword zeekTodo TODO XXX FIXME NOTE contained

syn match zeekDirective /\v\@(DEBUG|DIR|FILENAME)/
syn match zeekDirective /\v\@(deprecated)/
syn match zeekDirective /\v\@(ifdef|ifndef|else|endif|if)/
syn match zeekDirective /\v\@prefixes\s*\+?\=\s*/ nextgroup=zeekDirectiveArg
syn match zeekDirective /\v\@(load-plugin|load-sigs|load|unload)\s+/ nextgroup=zeekDirectiveArg
syn match zeekDirectiveArg /\v[^ #]*/ contained

syn region zeekString matchgroup=zeekSeparator start=/"/ skip=/\\"/ end=/"/ contains=zeekEscapeChar,zeekFmtSpec
syn region zeekPattern matchgroup=zeekSeparator start=/\v\/(.*\/)@=/ skip=/\\\// end=/\// contains=zeekEscapeChar
syn match zeekEscapeChar /\\./ contained
syn match zeekFmtSpec /\v\%\-?\d*(\.\d+)?[DTdxsefg]/ contained

syn keyword zeekModule module nextgroup=zeekModuleID skipwhite
syn match zeekModuleID /\v<([A-Za-z_][A-Za-z_0-9]*)(::[A-Za-z_][A-Za-z_0-9]*)*>/ contained

syn match zeekCall /\v<([A-Za-z_][A-Za-z_0-9]*)(::[A-Za-z_][A-Za-z_0-9]*)*>(\s*\()@=/

syn keyword zeekExport export

syn keyword zeekRedef redef
syn keyword zeekPrint print
syn keyword zeekCopy copy
syn keyword zeekAsync when timeout schedule
syn keyword zeekConditional if else switch
syn keyword zeekLoop for while
syn keyword zeekControlFlow return break next continue fallthrough
syn keyword zeekLabel case default

syn keyword zeekBool T F
syn match zeekInt /\v<\d+>/
syn match zeekInt /\v<0x[0-9a-fA-F]+>/
syn match zeekPort /\v<\d{1,5}>\/<(udp|tcp|icmp|unknown)>/

syn match zeekFloat /\v<((\d+\.\d*)|(\d*\.\d+))([eE][+-]?\d+)?>/
syn match zeekFloat /\v<(\d+)([eE][+-]?\d+)>/

syn match zeekInterval /\v<((\d+)|(\d+\.\d*)|(\d*\.\d+))([eE][+-]?\d+)?\s*(day|hr|min|msec|usec|sec)s?>/

syn match zeekHost /\v[A-Za-z0-9][A-Za-z0-9\-]*(\.[A-Za-z0-9][A-Za-z0-9\-]*)+/
syn match zeekAddr /\v(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[0-9]{1,2})\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[0-9]{1,2})\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[0-9]{1,2})\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[0-9]{1,2})/
" This IPv6 regex may not be 100% correct.  The real deal takes some effort.
syn match zeekAddr /\v\[([0-9a-fA-F]{0,4}:){2,7}([0-9a-fA-F]{0,4})((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[0-9]{1,2})\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[0-9]{1,2})\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[0-9]{1,2})\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[0-9]{1,2}))?\]/

syn keyword zeekTypeDef type

syn keyword zeekType any
syn keyword zeekType enum record set table vector
syn keyword zeekType addr bool count double file int interval pattern port
syn keyword zeekType string subnet time
syn keyword zeekType function hook event

syn keyword zeekTypeMod global local const option

syn keyword zeekType opaque nextgroup=zeekOpaqueOf skipwhite
syn keyword zeekOpaqueOf of nextgroup=zeekOpaqueID skipwhite contained
syn match zeekOpaqueID /\v<([A-Za-z_][A-Za-z_0-9]*)(::[A-Za-z_][A-Za-z_0-9]*)*>/ contained

syn keyword zeekOperatorWord in as is of
syn keyword zeekTableOp add delete

syn match zeekOperator /\v\>/
syn match zeekOperator /\v\</
syn match zeekOperator /\v\!/
syn match zeekOperator /\v\=/
syn match zeekOperator /\v\+/
syn match zeekOperator /\v\-/
syn match zeekOperator /\v\*/
syn match zeekOperator /\v\/(.*\/)@!/
syn match zeekOperator /\v\%/
syn match zeekOperator /\v\&/
syn match zeekOperator /\v\|/
syn match zeekOperator /\v\^/
syn match zeekOperator /\v\~/
syn match zeekOperator /\v\?/
syn match zeekOperator /\v\:/

syn match zeekOperator /\v\+\+/
syn match zeekOperator /\v\-\-/

syn match zeekOperator /\v\+\=/
syn match zeekOperator /\v\-\=/
syn match zeekOperator /\v\>\=/
syn match zeekOperator /\v\<\=/
syn match zeekOperator /\v\!\=/
syn match zeekOperator /\v\=\=/

syn match zeekOperator /\v\&\&/
syn match zeekOperator /\v\|\|/

syn match zeekOperator /\v\$/
syn match zeekOperator /\v\?\$/

syn match zeekAttribute /\v\&<(redef|priority|log|optional|default|add_func|delete_func|expire_func|read_expire|write_expire|create_expire|synchronized|persistent|rotate_interval|rotate_size|encrypt|raw_output|mergeable|error_handler|type_column|deprecated|on_change|backend|broker_store|broker_allow_complex_type|is_assigned)>/

highlight link zeekTodo    Todo
highlight link zeekComment Comment
highlight link zeekDirective PreProc
highlight link zeekDirectiveArg Underlined

highlight link zeekString String
highlight link zeekPattern String
highlight link zeekSeparator Delimiter
highlight link zeekEscapeChar SpecialChar
highlight link zeekFmtSpec Special

highlight link zeekType Type
highlight link zeekTypeDef Typedef
highlight link zeekTypeMod StorageClass
highlight link zeekAttribute StorageClass

highlight link zeekBool Boolean
highlight link zeekInt Number
highlight link zeekFloat Float
highlight link zeekAddr Constant
highlight link zeekHost Constant
highlight link zeekPort Constant
highlight link zeekInterval Constant

highlight link zeekOperator Operator
highlight link zeekOpaqueOf Keyword
highlight link zeekOperatorWord Keyword
highlight link zeekTableOp Keyword

highlight link zeekID Identifier
highlight link zeekModuleID Identifier
highlight link zeekOpaqueID Type
highlight link zeekCall Identifier

highlight link zeekConditional Conditional
highlight link zeekControlFlow Keyword
highlight link zeekLoop Repeat
highlight link zeekLabel Label

highlight link zeekModule Keyword
highlight link zeekRedef Keyword
highlight link zeekExport Keyword
highlight link zeekPrint Keyword
highlight link zeekCopy Keyword
highlight link zeekAsync Keyword
highlight link zeekKeyword Keyword

" TODO Could add Structure group to enum/record (re)definitions

let b:current_syntax = "zeek"
