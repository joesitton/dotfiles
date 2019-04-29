"
" Plugins
"
call plug#begin("~/.vim/plugged")

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'lambdalisue/suda.vim'
"Plug 'w0rp/ale'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'easymotion/vim-easymotion'
Plug 'pacha/vem-tabline'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:syntastic_always_populate_loc_list = 1

"
" Options
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
set number
set cursorline
set noruler
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


let &stl=''
let &stl.='%#Mode# %{toupper(mode())} %*'
let &stl.='%#Visual# %f'
let &stl.='%#Modified#%{IsModified()}%*'
let &stl.=' %h %q '
let &stl.='%#ReadOnly#%{ReadOnly()}%*'
let &stl.='%='
let &stl.='[%{&filetype}] '
let &stl.='%#Visual# %{&enc} |'
let &stl.=' %P '
"let &stl.='%#Error#%{LinterStatus()}%#* '

"
" Colorscheme
"
let base16colorspace = 256
colo base16-default-dark

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

hi Comment cterm=italic
hi WildMenu ctermbg=12 ctermfg=18 cterm=bold
hi StatusLine ctermbg=18
hi CursorLineNr cterm=bold

hi EasyMotionTarget ctermbg=none ctermfg=red cterm=bold
hi EasyMotionShade  ctermbg=none ctermfg=08
hi EasyMotionTarget2First ctermbg=none ctermfg=yellow
hi EasyMotionTarget2Second ctermbg=none ctermfg=yellow
hi EasyMotionMoveHL ctermbg=green ctermfg=black
hi EasyMotionIncSearch ctermbg=green ctermfg=black

hi VemTablineSelected ctermbg=12 ctermfg=18 cterm=bold

hi ReadOnly ctermfg=01 ctermbg=18 cterm=bold
hi Mode ctermfg=18 ctermbg=12 cterm=bold
hi Modified ctermfg=02 ctermbg=19 cterm=bold

"
" Mappings
"
let mapleader=';'

command W :w suda://%

map ; :
map <leader>w :w<CR>
map <leader><leader>w <Plug>(easymotion-bd-w)
map <leader><leader>f <Plug>(easymotion-sn)
map <C-n> :NERDTreeToggle<CR>

nmap j gj
nmap k gk
nmap <silent> <CR> :noh<CR>
nmap ga <Plug>(EasyAlign)
nmap <silent> <F3> :Tagbar<CR>
nmap <silent> <F2> :Goyo<CR>
nmap <leader>ss :setlocal spell!<CR>
nmap <leader>pp :setlocal paste!<CR>

nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>

"
" Helper functions
"
function! ReadOnly() abort
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ ' W:%d E:%d ',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

function! IsModified() abort
    if &modified
        return ' ++ '
    else
        return ' '
endfunction

"
" Other
"
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
autocmd BufWritePre * :%s/\s\+$//e
