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

" Move lines up or down in visual mode
xnoremap [e :m '<-2<CR>gv=gv
xnoremap ]e :m '>+1<CR>gv=gv

" Keep selection when indenting blocks
vnoremap < <gv
vnoremap > >gv

" Searching
map /  <Plug>(incsearch-forward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

" Quick saving/quitting
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>z :wqa!<CR>

" Buffers
nnoremap [b :BufferPrevious<CR>
nnoremap ]b :BufferNext<CR>
nnoremap <C-Left> :BufferMovePrevious<CR>
nnoremap <C-Right> :BufferMoveNext<CR>
nnoremap <leader>bd :BufferClose<CR>
nnoremap <leader>bw :BufferWipeout<CR>
nnoremap <leader>bp :BufferPick<CR>

" Tree
nnoremap <leader>. :NvimTreeToggle<CR>

" Telescope
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>ft :Telescope live_grep<CR>
nnoremap <leader>fm :Telescope marks<CR>
nnoremap <leader>fr :Telescope oldfiles<CR>
nnoremap <leader>or :Telescope registers<CR>

" Trouble
" nnoremap <leader>ldd :TroubleToggle lsp_document_diagnostics<CR>
" nnoremap <leader>ldw :TroubleToggle lsp_workspace_diagnostics<CR>

" LSP
nnoremap ? :Lspsaga hover_doc<CR>
nnoremap gd :Lspsaga lsp_finder<CR>
nnoremap gr :Lspsaga rename<CR>
nnoremap gp :Lspsaga preview_definition<CR>
nnoremap ]g :Lspsaga diagnostic_jump_next<CR>
nnoremap [g :Lspsaga diagnostic_jump_prev<CR>
nnoremap <leader>ca :Lspsaga code_action<CR>
vnoremap <leader>ca :<C-U>Lspsaga range_code_action<CR>

" DAP
nnoremap <leader>dt :lua require("dapui").toggle()<CR>
nnoremap <leader>db :lua require("dap").toggle_breakpoint()<CR>
nnoremap <leader>dc :lua require("dap").continue()<CR>
nnoremap <leader>ds :lua require("dap").step_into()<CR>
nnoremap <leader>dS :lua require("dap").step_over()<CR>

" EasyAlign
xmap <leader>ea <Plug>(EasyAlign)

" SnipRun
nnoremap <leader>sr :SnipRun<CR>
nnoremap <leader>sc :SnipClose<CR>

xmap <leader>sr :SnipRun<CR>
