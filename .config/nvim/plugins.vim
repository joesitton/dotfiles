call plug#begin("~/.vim/plugged")

" Appearance
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Functionality
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'andymass/vim-matchup'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Language-specific
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'mattn/emmet-vim', { 'for': 'html' }

Plug 'ryanoasis/vim-devicons'

call plug#end()
