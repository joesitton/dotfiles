" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive', { 'tag': 'v2.3' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_section_c = airline#section#create(['%m %r'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:webdevicons_enable_airline_statusline = 0

let g:deoplete#enable_at_startup = 1

let delimitMate_expand_cr = 1

let g:bufferline_echo = 0

" Vim settings

let base16colorspace = 256
colorscheme base16-default-dark
hi Comment gui=italic
hi LineNr guifg=#484848
hi WildMenu ctermbg=12 ctermfg=18

let mapleader = ';'

nmap ; :
nmap j gj
nmap k gk
nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-n> :NERDTreeToggle<CR>
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
nnoremap <CR> :noh<CR><CR>
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:my_cr_function() abort
    return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

set history=500
set autoread
set wildmenu
set wildmode=longest,full
set backspace=eol,start,indent
set ignorecase
set smartcase
set hlsearch
set incsearch
set nobackup
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set number
set cursorline
set noruler
set wrap
set noshowmode
set scrolloff=7
set hidden
set lazyredraw
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
autocmd BufWritePre * :%s/\s\+$//e
