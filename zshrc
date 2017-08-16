# Oh my Zsh
export ZSH=/home/joe/.oh-my-zsh

# Path
export PATH=$PATH:/home/joe/.gem/ruby/2.4.0/bin

# Theme
ZSH_THEME="gallifrey"

# Plugins
plugins=(zsh-syntax-highlighting)

# Options
setopt ZLE
setopt CORRECT
setopt AUTO_CD
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
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

alias pac='s pacman'
alias yao='yaourt'

alias la='ls -a'
alias ll='ls -lh'

alias vim='nvim'
alias top='htop'

cd() { builtin cd "$@" && ls; }
