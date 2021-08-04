" Filetypes
autocmd FileType html,css,scss,javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType * setlocal formatoptions-=cro

" Indent Lines
" autocmd FileType Trouble,html,css :IndentLinesDisable

" Force autoread to run on focus
autocmd FocusGained,BufEnter * :checktime

" Auto-remove trailing whitespace
autocmd BufRead * if &modifiable | %s/\s\+$//e | endif

" Auto-jump to last cursor position
" autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd BufWrite * mkview
autocmd BufRead * silent! loadview

" Auto-format on save
autocmd BufWritePost * silent FormatWrite
