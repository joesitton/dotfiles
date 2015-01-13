" Pathogen
" filetype off
" call pathogen#infect()
" call pathogen#helptags()
" filetype plugin indent on

" Solarized settings
let g:solarized_termcolors=256

" Color scheme and background
colo solarized
set bg=light
set t_Co=256

" Powerline / airline
set laststatus=2
set noshowmode

" let g:airline_powerline_fonts=1

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Highlight current line
set cursorline

" Always show line number and position
set ruler
set number

" Proper backspace
set backspace=2

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Set utf8
set encoding=utf8

" Turn backup off
set nobackup
set nowb
set noswapfile

" 500 character line break
set lbr
set tw=500

" Tabbing
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" Indents
set ai
set si
set cindent

" Matching brackets blink
set mat=2

" Sudo save the file
command W w !sudo tee % > /dev/null

" Hide the buffer when its abandoned
set hid

" Show matching brackets
set showmatch

" Turn off stupid error effects
set noerrorbells
set novisualbell
set t_vb =
set tm=500

" Enable syntax highlighting
syntax enable

" Wrap lines
set wrap

" Mappings
map j gj
map k gk
