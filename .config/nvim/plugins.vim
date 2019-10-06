call plug#begin("~/.vim/plugged")

Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'andymass/vim-matchup'
Plug 'qpkorr/vim-bufkill'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'

Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'python/black', { 'for': 'python' }
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mhartington/nvim-typescript', { 'do': ':!install.sh \| UpdateRemotePlugins', 'for': 'typescript' }

Plug 'ryanoasis/vim-devicons'

call plug#end()
