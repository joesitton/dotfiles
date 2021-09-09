"               __  __  _                        _
"    ________  / /_/ /_(_)___  ____ _______   __(_)___ ___
"   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/ | / / / __ `__ \
"  (__  )  __/ /_/ /_/ / / / / /_/ (__  )| |/ / / / / / / /
" /____/\___/\__/\__/_/_/ /_/\__, /____(_)___/_/_/ /_/ /_/
"                           /____/

let g:python3_host_prog = "$HOME/.config/nvim/venv/bin/python"

" Colorscheme
set t_Co=256
set background=dark
set termguicolors

let g:base16colorspace = 256
let g:completion_menu_length = 120

colorscheme base16-default-dark

" Persistent undo
set undofile undodir=$HOME/.config/nvim/.undodir

" Tabs
set autoindent smartindent
set expandtab smarttab
set tabstop=4 softtabstop=4 shiftwidth=4

" Number lines
set synmaxcol=200
set signcolumn=auto
set number numberwidth=2
set norelativenumber
set cursorline

" Scrolloff
set scrolloff=5 sidescrolloff=10

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
set title
set hidden
set mouse=a
set autoread
set linebreak
set lazyredraw
set cmdheight=2
set complete-=t
set iskeyword+=_
set shortmess=Ic
set pumheight=20
set wildignorecase
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
set completeopt=menuone,noselect

" Disabled settings
set nowrap
set noshowmode
set nobackup nowritebackup
