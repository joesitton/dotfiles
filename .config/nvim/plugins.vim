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

" Colorschemes
Plug 'chriskempson/base16-vim'

" Additional syntax
Plug 'sheerun/vim-polyglot'
Plug 'Glench/Vim-Jinja2-Syntax'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-telescope/telescope.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'folke/trouble.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'

" Tab bar
Plug 'romgrk/barbar.nvim'

" Statusline
Plug 'hoob3rt/lualine.nvim'

" Tree
Plug 'kyazdani42/nvim-tree.lua'

" Completion
Plug 'hrsh7th/nvim-compe'

" Autopairs
Plug 'windwp/nvim-autopairs'

" Comments
Plug 'b3nj5m1n/kommentary'

" Surround
Plug 'tpope/vim-surround'

" Git
Plug 'lewis6991/gitsigns.nvim'

" Rainbow brackets
Plug 'p00f/nvim-ts-rainbow'

" Formatter
Plug 'mhartington/formatter.nvim'

" Colorizer
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Minimap
Plug 'wfxr/minimap.vim',  {'do': ':!cargo install --locked code-minimap'}

Plug 'easymotion/vim-easymotion'

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
