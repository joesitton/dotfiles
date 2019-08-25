" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')
" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

"
"Options
"
set history=500
set autoread
set wildmenu
set wildmode=longest,full
set backspace=indent,eol,start
"set completeopt=noinsert,menuone,noselect
set ignorecase
set smartcase
set hlsearch
set incsearch
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set cursorline
set noruler
set nonumber
set relativenumber
set wrap
set linebreak
set noshowmode
set showtabline=2
set scrolloff=7
set sidescrolloff=5
set hidden
set lazyredraw
set encoding=utf-8
set updatetime=100
set laststatus=2
set ttimeout
set ttimeoutlen=1000
set ttimeoutlen=0
set cmdheight=2
"set shortmess+=c
set colorcolumn=80
set conceallevel=0 concealcursor=niv
set t_Co=256


"
" Colorscheme
"
let base16colorspace=256
colo base16-default-dark
set background=dark

autocmd InsertEnter,WinLeave * set nocursorline
autocmd InsertLeave,WinEnter * set cursorline

autocmd InsertEnter * set norelativenumber number
autocmd InsertLeave * set relativenumber nonumber

"
" Mappings
"
let mapleader=' '

map <leader>w :w<CR>
map <leader>cd :cd %:p:h<cr>:pwd<cr>

nmap j gj
nmap k gk
nmap <silent> <CR> :noh<CR>
nmap <leader>ss :setlocal spell!<CR>
nmap <leader>pp :setlocal paste!<CR>
nmap <leader>c :close<CR>

nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap [w <C-W><C-H>
nnoremap ]w <C-W><C-L>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"
" Other
"
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

autocmd BufWritePre * :%s/\s\+$//e
