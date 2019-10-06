let mapleader = ' '

map 0 ^
map E $
map <leader>w :w<CR>
map <leader>bd :BD<CR>

nmap j gj
nmap k gk
nmap <silent> <CR> :noh<CR>
nmap <leader>ss :setlocal spell!<CR>
nmap <leader>pp :setlocal paste!<CR>
nmap <leader>ag :Ag<CR>
nmap <leader>F :Files<CR>
nmap <leader>L :Lines<CR>
nmap <leader>u :UndotreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>

nnoremap U :redo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap [w <C-W><C-H>
nnoremap ]w <C-W><C-L>
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [e  :m .-2<CR>==
nnoremap ]e  :m .+1<CR>==
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <Leader>c *``cgn
nnoremap <silent> K :call <SID>show_documentation()<CR>

cnoremap <C-A> <Home>
cnoremap <C-E> <End>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

imap <expr> <cr> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<cr>"
smap <tab> <Plug>(neosnippet_expand_or_jump)
xmap <tab> <Plug>(neosnippet_expand_target)

xnoremap < <gv
xnoremap > >gv
xnoremap [e :m '<-2<CR>gv=gv
xnoremap ]e :m '>+1<CR>gv=gv

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  endif
endfunction
