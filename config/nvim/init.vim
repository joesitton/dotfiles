" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

Plugin 'vundlevim/vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'
Plugin 'w0rp/ale'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mattn/emmet-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tomlion/vim-solidity'

call vundle#end()
filetype plugin indent on

" Airline
let g:airline_theme='base16'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''

let g:airline_left_sep= ''
let g:airline_right_sep = ''

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ycm#enabled = 1

let g:airline_powerline_fonts = 1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Ale
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 0

let g:ale_sign_error = "!!"

let g:airline#extensions#ale#enabled = 1

" Emmet
let g:user_emmet_leader_key='<C-E>'

" Colorscheme
syntax enable
set bg=dark
let base16colorspace=256
colo base16-default-dark

autocmd BufRead,BufNewFile *.asm set ft=nasm

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
set ttimeoutlen=10

" Mappings
nmap j gj
nmap k gk

nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-n> :NERDTreeToggle<CR>
