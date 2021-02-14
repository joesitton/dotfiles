"     _       _ __        _
"    (_)___  (_) /__   __(_)___ ___
"   / / __ \/ / __/ | / / / __ `__ \
"  / / / / / / /__| |/ / / / / / / /
" /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
"

source $HOME/.config/nvim/plugins.vim

for file in split(glob("$HOME/.config/nvim/plug-config/*"))
	execute 'source' file
endfor

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
