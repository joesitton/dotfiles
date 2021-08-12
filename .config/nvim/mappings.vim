"                                 _                        _
"    ____ ___  ____ _____  ____  (_)___  ____ _______   __(_)___ ___
"   / __ `__ \/ __ `/ __ \/ __ \/ / __ \/ __ `/ ___/ | / / / __ `__ \
"  / / / / / / /_/ / /_/ / /_/ / / / / / /_/ (__  )| |/ / / / / / / /
" /_/ /_/ /_/\__,_/ .___/ .___/_/_/ /_/\__, /____(_)___/_/_/ /_/ /_/
"                /_/   /_/            /____/

let mapleader=' '

nnoremap J }
nnoremap K {
nnoremap H ^
nnoremap L $
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap Q @q

" Quick window selection
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quick saving/quitting
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>z :wqa!<CR>

" Move lines up or down in visual mode
xnoremap <silent> [e :m '<-2<CR>gv=gv
xnoremap <silent> ]e :m '>+1<CR>gv=gv

" Keep selection when indenting blocks
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Buffers
nnoremap <silent> [b :BufferPrevious<CR>
nnoremap <silent> ]b :BufferNext<CR>
nnoremap <silent> <leader>bd :BufferWipeout<CR>
nnoremap <silent> <C-Left> :BufferMovePrevious<CR>
nnoremap <silent> <C-Right> :BufferMoveNext<CR>

" Tree
nnoremap <F1> :NvimTreeToggle<CR>

" Telescope
nnoremap <F2> :Telescope find_files<CR>

" Trouble
nnoremap <F4> :TroubleToggle lsp_document_diagnostics<CR>
nnoremap <F5> :TroubleToggle lsp_workspace_diagnostics<CR>

" LSP
nnoremap <silent> ? :Lspsaga hover_doc<CR>
nnoremap <silent> gd :Lspsaga lsp_finder<CR>
nnoremap <silent> gr :Lspsaga rename<CR>
nnoremap <silent> gp :Lspsaga preview_definition<CR>
nnoremap <silent> ]g :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> [g :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>ca :Lspsaga code_action<CR>
vnoremap <silent> <leader>ca :<C-U>Lspsaga range_code_action<CR>

" DAP
nnoremap <leader>dt :lua require("dapui").toggle()<CR>
nnoremap <leader>db :lua require("dap").toggle_breakpoint()<CR>
nnoremap <leader>dc :lua require("dap").continue()<CR>
nnoremap <leader>ds :lua require("dap").step_into()<CR>
nnoremap <leader>dS :lua require("dap").step_over()<CR>

" Searching
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

" EasyAlign
xmap a <Plug>(EasyAlign)

" Bookmarks
nnoremap <silent> ma :Telescope vim_bookmarks all<CR>
