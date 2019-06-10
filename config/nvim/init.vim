"
" Plugins
"
call plug#begin("~/.vim/plugged")

Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'lambdalisue/suda.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'neomake/neomake'
"Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neco-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'milkypostman/vim-togglelist'
Plug 'xianzhon/vim-code-runner'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'davidhalter/jedi-vim'

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
    \             ['gitbranch', 'cocstatus', 'filename', 'readonly', 'modified'] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'readonly': 'LightlineReadonly',
	\	'cocstatus': 'coc#status',
    \ },
    \ }

let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#read_only    = ''

let g:startify_custom_header = ''

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
set t_Co=256
set cmdheight=2

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
nmap ga <plug>(EasyAlign)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

xmap ga <plug>(EasyAlign)

nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

"
" Helper functions
"
"function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
"endfunction

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? '' : ''
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
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
