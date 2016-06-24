# Oh my Zsh
export ZSH=/home/joe/.oh-my-zsh
ZSH_THEME="glister"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16/shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

plugins=(extract)

# Options
setopt CORRECT
setopt HIST_REDUCE_BLANKS
setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
setopt ZLE
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

source $ZSH/oh-my-zsh.sh

# Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

# Aliases
alias s='sudo'
alias pls='s $(fc -ln -1)'

alias x='extract'

alias pac='s pacman'
alias yao='yaourt'

alias ls='exa'
alias la='ls -a'
alias ll='ls -lh'

source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
