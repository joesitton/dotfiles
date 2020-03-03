source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugin-options.vim
source $HOME/.config/nvim/mappings.vim

set history=500
set autoread
set scrolloff=999 sidescrolloff=10
set wildmenu
set ruler
set cmdheight=2
set hidden
set backspace=eol,start,indent
set completeopt=menuone,noinsert,noselect
set nowrap
set ignorecase smartcase
set hlsearch incsearch
set lazyredraw
set magic
set showmatch mat=2
set noerrorbells novisualbell t_vb=
set ttimeout ttimeoutlen=0
set foldmethod=manual
set nobackup nowb noswapfile
set expandtab smarttab
set shiftwidth=4 tabstop=4
set linebreak textwidth=500
set autoindent smartindent wrap
set switchbuf=useopen,usetab,newtab showtabline=2
set laststatus=2
set cursorline
set relativenumber number
set shortmess=Ic
set noshowmode
set updatetime=300
set signcolumn=yes
set t_Co=256
set undodir=~/.config/nvim/undodir
set undofile
set concealcursor=niv

"
" Appearance
"
let g:netrw_banner = 0
let base16colorspace = 256

set background=dark
colo base16-default-dark

hi Comment cterm=italic
hi WildMenu cterm=bold ctermfg=black ctermbg=blue
hi Pmenu ctermfg=white ctermbg=240
hi PmenuSel cterm=bold ctermfg=black ctermbg=white
hi NERDTreeFile ctermfg=251

autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

au FileType scss,css,json,html setlocal shiftwidth=2 softtabstop=2 | :IndentLinesDisable
au FileType javascript,typescript setlocal shiftwidth=2 softtabstop=2
