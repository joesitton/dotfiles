# Path to omz
export ZSH=$HOME/.oh-my-zsh

# Prompt theme
ZSH_THEME="gallifrey"

# Base16 colors
BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Compinit
autoload -U compinit && compinit

# Plugins
plugins=()

# Set PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Source files
source $ZSH/oh-my-zsh.sh
source /usr/share/autojump/autojump.zsh

for f in ~/.{aliases,functions}; do
    source "$f"
done

# Set grep color to yellow
export GREP_COLOR='1;33'

# UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Some options
setopt CORRECT
setopt HIST_REDUCE_BLANKS
setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
unsetopt CASE_GLOB

# Editor
export EDITOR=vim

# Less / colored man pages
export LESS="-F X -R -P ?f%f .?n?m(file %i of %m) ..?ltlines %lt-%lb?L/%L. :
            byte %bB?s/%s. .?e(END) ?x- Next\: %x.:?pB%pB\%..%t"

export LESS_TERMCAP_ti=$'\e[01;37m'         # white
export LESS_TERMCAP_mb=$'\e[38;5;117m'      # light blue
export LESS_TERMCAP_md=$'\e[38;5;117m'      # light blue
export LESS_TERMCAP_me=$'\e[0m'             # color reset
export LESS_TERMCAP_us=$'\e[01;33m'         # yellow
export LESS_TERMCAP_ue=$'\e[0m'             # color reset
