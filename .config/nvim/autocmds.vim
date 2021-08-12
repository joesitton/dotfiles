" Auto-jump to last cursor position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Filetype local options
autocmd FileType html,css,scss,javascript,lua setlocal shiftwidth=2 tabstop=2

" Force autoread to run on focus
autocmd FocusGained,BufEnter * :checktime

" Auto-remove trailing whitespace
autocmd BufRead * if &modifiable | %s/\s\+$//e | endif

" Auto-format on save
autocmd BufWritePost * silent FormatWrite
