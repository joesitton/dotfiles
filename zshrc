# Completion
autoload -Uz compinit && compinit

zstyle ':completion:*' completer _oldlist _complete
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cmd'

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export GOPATH=$HOME/.go
export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:$HOME/Scripts:$GOPATH

export EDITOR=nvim
export PAGER=less
export TERM=xterm-256color
export BROWSER=firefox

SAVEHIST=1000
HISTSIZE=1000

ZSH_THEME="spaceship"
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_JOBS_SYMBOL=
SPACESHIP_JOBS_COLOR=yellow
SPACESHIP_JOBS_AMOUNT_PREFIX=" "
SPACESHIP_VI_MODE_INSERT=[i]
SPACESHIP_VI_MODE_NORMAL=[n]
SPACESHIP_VI_MODE_COLOR=#484848
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL="✘ "

SPACESHIP_PROMPT_ORDER=(user dir host git package node ruby golang exec_time line_sep jobs char)
SPACESHIP_RPROMPT_ORDER=(exit_code vi_mode)

export KEYTIMEOUT=1

PROMPT_TITLE="$PWD"

plugins=(
        fast-syntax-highlighting
        colored-man-pages
        #zsh-syntax-highlighting
        zsh-autosuggestions
        extract
        title
        git
        #vi-mode
        z
        )

zle -N autosuggest-accept
bindkey '^[ ' autosuggest-accept
source $ZSH/oh-my-zsh.sh

setopt CORRECT
setopt MULTIOS
setopt AUTO_CD
setopt GLOB_COMPLETE
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB
setopt NUMERIC_GLOB_SORT
setopt ZLE
setopt NO_BEEP
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

alias s='sudo'
alias pls='sudo $(fc -ln -1)'
alias pac='s pacman'
alias pacin='pac -S'
alias pacs='pac -Ss'
alias pacup='pac -Syyu'
alias aur='yay'
alias aurin='aur -S --answerclean None --answerdiff None --answeredit None'
alias aurs='aur -Ss'
alias ls='exa --group-directories-first'
alias la='exa -a'
alias ll='exa -lh --git'
alias v='nvim -X'
alias vim='v'
alias vd='v -d'
alias vimdiff='v -d'
alias top='htop'
alias ip='ip -c'
alias py='python'
alias ssh='ssh'
alias cat='bat'
alias g++='g++ -O2 -std=c++11'
alias ncm='ncmpcpp'
alias j='z'

alias -g L="| less"
alias -g G="| grep -i"
alias -g W="| wc -l"

cd() { builtin cd "$@" && ls; }
mkd() { mkdir -p "$@" && cd "$_" }
f() {
    fff
    clear
}

export FFF_W3M_XOFFSET=10
export FFF_W3M_YOFFSET=10
export FFF_MARK_FORMAT="-> %f"
export FFF_COL2=4
export FFF_COL3=3
export FFF_COL4=9

zstyle ':completion:*' menu select
