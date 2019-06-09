"
" Plugins
"
call plug#begin("~/.vim/plugged")

Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'lambdalisue/suda.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'pacha/vem-tabline'
Plug 'Yggdroot/indentLine'
Plug 'neomake/neomake'
Plug 'Shougo/neocomplcache.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'milkypostman/vim-togglelist'
Plug 'xianzhon/vim-code-runner'

call plug#end()

let g:indentLine_char = '│'

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

call neomake#configure#automake('nw', 750)
let g:neomake_open_list = 2

let g:lightline = {
    \ 'colorscheme': 'base16_default_dark',
    \ 'active': {
    \   'left': [ ['mode', 'paste', 'spell'],
    \             ['gitbranch', 'filename', 'readonly', 'modified'] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

"
"Options
"
set history=500
set autoread
set wildmenu
set wildmode=longest,full
set backspace=indent,eol,start
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
set noshowmode
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
set t_Co=256

"
" Colorscheme
"
let base16colorspace = 256
colo base16-default-dark
set background=dark

autocmd InsertEnter,WinLeave * set nocursorline
autocmd InsertLeave,WinEnter * set cursorline

autocmd InsertEnter * set norelativenumber number
autocmd InsertLeave * set relativenumber nonumber

hi Comment cterm=italic
hi WildMenu ctermbg=12 ctermfg=18 cterm=bold
hi StatusLine ctermbg=18
hi CursorLineNr cterm=bold ctermfg=16

hi EasyMotionTarget ctermbg=none ctermfg=red cterm=bold
hi EasyMotionShade  ctermbg=none ctermfg=08
hi EasyMotionTarget2First ctermbg=none ctermfg=yellow
hi EasyMotionTarget2Second ctermbg=none ctermfg=yellow
hi EasyMotionMoveHL ctermbg=green ctermfg=black
hi EasyMotionIncSearch ctermbg=green ctermfg=black

hi VemTablineSelected ctermbg=12 ctermfg=18 cterm=bold

hi ReadOnly ctermfg=01 ctermbg=18 cterm=bold
hi Mode ctermfg=18 ctermbg=12 cterm=bold
hi Modified ctermfg=02 ctermbg=18 cterm=bold
hi SynErr ctermfg=01 ctermbg=19

"
" Mappings
"
let mapleader=' '

command W :w suda://%

map <leader>w :w<CR>
map <leader><leader>w <Plug>(easymotion-bd-w)
map <leader><leader>f <Plug>(easymotion-sn)
map <F2> :NERDTreeToggle<CR>
map <leader>bd :BD<CR>

nmap j gj
nmap k gk
nmap <silent> <CR> :noh<CR>
nmap <silent> <F3> :Tagbar<CR>
nmap <leader>ss :setlocal spell!<CR>
nmap <leader>pp :setlocal paste!<CR>
nmap <silent><leader>r <plug>CodeRunner

nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

"
" Helper functions
"
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

"
" Other
"
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
