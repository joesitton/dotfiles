" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'
Plugin 'Shougo/neocomplcache.vim'

call vundle#end()
filetype plugin indent on

" Autocomplete
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'

" Colorscheme (base16)
syntax enable
set bg=dark
let base16colorspace=256
colo base16-default

" Options
set history=700
set cursorline
set splitbelow
set splitright
set ruler
set number
set backspace=2
set ignorecase
set smartcase
set hlsearch
set incsearch
set laststatus=2
set noshowmode
set encoding=utf8
set nobackup
set nowb
set noswapfile
set lbr
set tw=500
set scrolloff=5
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ai
set si
set cindent
set mat=2
set hid
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set wrap
set lazyredraw
set magic

" Sudo save a file
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Mappings
nmap j gj
nmap k gk
nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
