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
Plug 'lambdalisue/suda.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'neomake/neomake'
Plug 'qpkorr/vim-bufkill'
Plug 'xianzhon/vim-code-runner'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'Chiel92/vim-autoformat'
Plug 'terryma/vim-smooth-scroll'
Plug 'junegunn/limelight.vim'
Plug 'raimondi/delimitmate'
Plug 'unblevable/quick-scope'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'

Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'python/black', { 'for': 'python' }
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'mhartington/nvim-typescript', { 'do': ':!install.sh \| UpdateRemotePlugins', 'for': 'typescript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'valloric/matchtagalways', { 'for': 'html' }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss']}

call plug#end()

" Lightline
let g:lightline = {
            \ 'colorscheme': 'base16_default_dark',
            \ 'active': {
            \   'left': [ ['mode', 'paste', 'spell'],
            \             ['gitbranch', 'cocstatus', 'filename', 'readonly', 'modified'] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'readonly': 'LightlineReadonly',
            \   'filetype': 'FiletypeIcon',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number  = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#read_only    = '[RO]'

" Auto complete
let g:deoplete#enable_at_startup = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
let g:neosnippet#enable_completed_snippet = 1

" Linting
call neomake#configure#automake('w')
let g:neomake_open_list = 0
let g:neomake_python_enabled_makers = ["pyflakes"]
let g:nvim_typescript#diagnostics_enable = 0

" Other
let g:CodeRunnerCommandMap = {
            \ 'python' : 'python3 $fileName'
            \}
let g:startify_custom_header = ''
let g:indentLine_char = '│'
let g:lt_height = 5
let g:black_linelength = 79
let g:user_emmet_leader_key='<c-e>'
let g:startify_change_to_vcs_root = 1
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:DevIconsEnableFoldersOpenClose = 1

"
"Options
"
set history=500
set autoread
set wildmenu
set wildmode=longest,full
set backspace=indent,eol,start
set completeopt=noinsert,menuone,noselect
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
set shortmess+=c
set colorcolumn=80
set conceallevel=0 concealcursor=niv
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

hi EasyMotionTarget ctermbg=none ctermfg=02 cterm=bold
hi EasyMotionShade  ctermbg=none ctermfg=08
hi EasyMotionTarget2First ctermbg=none ctermfg=yellow
hi EasyMotionTarget2Second ctermbg=none ctermfg=yellow
hi EasyMotionMoveHL ctermbg=green ctermfg=black
hi EasyMotionIncSearch ctermbg=green ctermfg=black

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0
            \| autocmd BufLeave <buffer> set laststatus=2

"
" Mappings
"
let mapleader=' '

map <leader>w :w<CR>
map <leader><leader>w <Plug>(easymotion-bd-w)
map <leader><leader>f <Plug>(easymotion-sn)
map <F2> :NERDTreeToggle<CR>
map <leader>bd :BD<CR>
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>l :Limelight!! 0.7<cr>

nmap j gj
nmap k gk
nmap <silent> <CR> :noh<CR>
nmap <leader>ss :setlocal spell!<CR>
nmap <leader>pp :setlocal paste!<CR>
nmap <silent><leader>R <plug>CodeRunner
nmap ga <plug>(EasyAlign)
nmap <leader>c :close<CR>

xmap ga <plug>(EasyAlign)

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap [w <C-W><C-H>
nnoremap ]w <C-W><C-L>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <leader>bf :Autoformat<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>u :UndotreeToggle<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <expr> <cr> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<cr>"
smap <tab> <Plug>(neosnippet_expand_or_jump)
xmap <tab> <Plug>(neosnippet_expand_target)

"
" Helper functions
"
function! LightlineReadonly()
    return &readonly && &filetype !=# 'help' ? '[RO]' : ''
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! FiletypeIcon()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft'): ''
endfunction

"
" Other
"
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   execute "normal! g`\"" |
            \ endif
autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags shiftwidth=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype json,html :IndentLinesDisable
autocmd FileType json,html setlocal shiftwidth=2
autocmd FileType json,html let b:autoformat_autoindent=2

