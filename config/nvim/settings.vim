"               __  __  _                        _
"    ________  / /_/ /_(_)___  ____ _______   __(_)___ ___
"   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/ | / / / __ `__ \
"  (__  )  __/ /_/ /_/ / / / / /_/ (__  )| |/ / / / / / / /
" /____/\___/\__/\__/_/_/ /_/\__, /____(_)___/_/_/ /_/ /_/
"                           /____/
"

" Colorscheme
set t_Co=256
set background=dark
set termguicolors

" Base16
let g:base16colorspace=256

colorscheme base16-default-dark

hi Comment cterm=italic gui=italic

" Scrolloff
set scrolloff=5 sidescrolloff=10

" Persistent undo
set undofile undodir=$HOME/.config/nvim/undodir

" Tabs
set smartindent
set expandtab smarttab
set tabstop=4 softtabstop=4 shiftwidth=4

" Number lines
set synmaxcol=200
set signcolumn=auto
set number numberwidth=1
set cursorline

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
set title
set autoread
set linebreak
set lazyredraw
set cmdheight=2
set complete-=t
set shortmess=ac
set pumheight=10
set iskeyword+=-
set wildignorecase
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
set completefunc=emoji#complete

" Disabled settings
set nowrap
set noshowmode
set nobackup nowritebackup

" Don't automatically continue comments
autocmd FileType * setlocal formatoptions-=cro

" Set filetypes
autocmd BufRead * %s/\s\+$//e
autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara
autocmd BufNewFile,BufRead Dockerfile setlocal filetype=Dockerfile
autocmd FileType html,css,scss,javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType Dockerfile setlocal filetype=dockerfile
autocmd FileType dart setlocal shiftwidth=2
