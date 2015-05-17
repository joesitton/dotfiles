" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/neocomplcache.vim'

call vundle#end()
filetype plugin indent on

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" History
set history=700

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'

" Color scheme and syntax
let g:solarized_termcolors=256
set bg=dark
colo eighties
syntax on

" Highlight current line
set cursorline

" More natural splits
set splitbelow
set splitright

" Always show line number and position
set ruler
set number

" Proper backspace
set backspace=2

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Statusline
set laststatus=2
set noshowmode

" Set utf8
set encoding=utf8

" Turn backup off
set nobackup
set nowb
set noswapfile

" 500 character line break
set lbr
set tw=500

" Scrolloff
set scrolloff=5

" Tabbing
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Indents
set ai
set si
set cindent

" Matching brackets blink
set mat=2

" Hide the buffer when its abandoned
set hid

" Show matching brackets
set showmatch

" Turn off stupid error effects
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Wrap lines
set wrap

" Timeout length
set timeoutlen=50

set lazyredraw
set magic

" Sudo save a file
command! W w !sudo tee % > /dev/null

" Mappings
nmap j gj
nmap k gk
nnoremap U :redo<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
