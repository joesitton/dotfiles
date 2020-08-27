"                                 _                        _
"    ____ ___  ____ _____  ____  (_)___  ____ _______   __(_)___ ___
"   / __ `__ \/ __ `/ __ \/ __ \/ / __ \/ __ `/ ___/ | / / / __ `__ \
"  / / / / / / /_/ / /_/ / /_/ / / / / / /_/ (__  )| |/ / / / / / / /
" /_/ /_/ /_/\__,_/ .___/ .___/_/_/ /_/\__, /____(_)___/_/_/ /_/ /_/
"                /_/   /_/            /____/
"

let mapleader=' '

nnoremap J }
nnoremap K {
nnoremap H ^
nnoremap L $
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap Q @q
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>w :w<CR>
nnoremap <leader>z :wq<CR>
nnoremap <leader>q :q!<CR>
nnoremap <silent> <C-_> :Commentary<CR>
nnoremap <silent> [w <C-W><C-H>
nnoremap <silent> ]w <C-W><C-L>
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> <leader>bd :Bdelete<CR>
nnoremap <silent> <leader>bw :Bwipeout<CR>
nnoremap <silent> <leader>cd :cd %:p:h<CR>
nnoremap <silent> <F1> :Rg<CR>
nnoremap <silent> <F2> :Files<CR>
nnoremap <silent> <F3> :Goyo<CR>
nnoremap <silent> <F12> :TagbarToggle<CR>

xnoremap <silent> <C-_> :Commentary<CR>
xnoremap <silent> [e :m '<-2<CR>gv=gv
xnoremap <silent> ]e :m '>+1<CR>gv=gv

vnoremap <silent> < <gv
vnoremap <silent> > >gv
