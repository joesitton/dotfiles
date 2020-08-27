"               __  __  _                        _         
"    ________  / /_/ /_(_)___  ____ _______   __(_)___ ___ 
"   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/ | / / / __ `__ \
"  (__  )  __/ /_/ /_/ / / / / /_/ (__  )| |/ / / / / / / /
" /____/\___/\__/\__/_/_/ /_/\__, /____(_)___/_/_/ /_/ /_/ 
"                           /____/                         
" 

" Colorscheme
let base16colorspace=256
set background=dark
set notermguicolors
set t_Co=256
colorscheme base16-default-dark

" Scrolloff
set scrolloff=5 sidescrolloff=10

" Persistent undo
set undofile undodir=$HOME/.config/undodir

" Tabs
set smartindent
set expandtab smarttab
set tabstop=4 softtabstop=4 shiftwidth=4 

" Number lines
set synmaxcol=200
set signcolumn=auto
set number numberwidth=1
set cursorline

highlight CursorLineNr ctermfg=2

" Searching
set smartcase ignorecase
set nohlsearch incsearch

" Timeouts
set updatetime=300
set ttimeout ttimeoutlen=0
set timeout timeoutlen=1000

" Tabline
set showtabline=2

" Splits
set splitright splitbelow

" Misc
set hidden
set mouse=a
set autoread
set linebreak
set lazyredraw
set cmdheight=2
set complete-=t
set shortmess=Ic
set pumheight=10
set iskeyword+=-
set wildignorecase

" Don't automatically continue comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disabled settings
set nowrap
set noshowmode
set nobackup nowritebackup
