"            __            _                  _         
"     ____  / /_  ______ _(_)___  ______   __(_)___ ___ 
"    / __ \/ / / / / __ `/ / __ \/ ___/ | / / / __ `__ \
"   / /_/ / / /_/ / /_/ / / / / (__  )| |/ / / / / / / /
"  / .___/_/\__,_/\__, /_/_/ /_/____(_)___/_/_/ /_/ /_/ 
" /_/            /____/                                 
" 

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Appearance
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'psliwka/vim-smoothie'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Yggdroot/indentLine'

" Functionality
Plug 'moll/vim-bbye'
Plug 'tpope/vim-sleuth'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'

" Must load last
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Auto-install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
