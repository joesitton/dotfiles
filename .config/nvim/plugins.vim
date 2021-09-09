"            __            _                  _
"     ____  / /_  ______ _(_)___  ______   __(_)___ ___
"    / __ \/ / / / / __ `/ / __ \/ ___/ | / / / __ `__ \
"   / /_/ / / /_/ / /_/ / / / / (__  )| |/ / / / / / / /
"  / .___/_/\__,_/\__, /_/_/ /_/____(_)___/_/_/ /_/ /_/
" /_/            /____/
"

" Auto-install vim-plug
if empty(glob("$HOME/.config/nvim/autoload/plug.vim"))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin("$HOME/.config/nvim/.plugins")

" Lua deps
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Appearance
Plug 'RRethy/nvim-base16'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'SmiteshP/nvim-gps'
Plug 'lewis6991/gitsigns.nvim'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'
Plug 'lukas-reineke/indent-blankline.nvim'

" Navigation
Plug 'nvim-telescope/telescope.nvim'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'haya14busa/incsearch.vim'
Plug 'ggandor/lightspeed.nvim'

" Utility
Plug 'b3nj5m1n/kommentary'
Plug 'tpope/vim-surround'
Plug 'mhartington/formatter.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'jghauser/mkdir.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mbbill/undotree'
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}

" Completion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-autopairs'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'folke/trouble.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'xiyaowong/nvim-cursorword'

" DAP
" Plug 'Pocco81/DAPInstall.nvim'
" Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'
" Plug 'theHamsta/nvim-dap-virtual-text'

" Arduino
" Plug 'stevearc/vim-arduino'

call plug#end()

" Auto-install missing plugins
autocmd VimEnter *
    \   if len(filter(values(g:plugs), "!isdirectory(v:val.dir)"))
    \ |     PlugInstall --sync | q
    \ | endif

" Source plugin configurations
for file in split(glob("$HOME/.config/nvim/config/*"))
	silent! execute 'source' file
endfor
