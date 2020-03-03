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
nmap <F2> :NERDTreeToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap U :redo<CR>
nnoremap [w <C-W><C-H>
nnoremap ]w <C-W><C-L>
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [e :m .-2<CR>==
nnoremap ]e :m .+1<CR>==
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <C-_> :Commentary<cr>

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

xnoremap > >gv
xnoremap [e :m '<-2<CR>gv=gv
xnoremap ]e :m '>+1<CR>gv=gv
xnoremap <C-_> :Commentary<cr>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"
" COC
"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
