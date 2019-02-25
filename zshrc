# Completion
autoload -Uz compinit && compinit

#zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _oldlist _complete
#zstyle ':completion:*' format $'\n%F{magenta}%B%d:%b%f'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cmd'

kitty + complete setup zsh | source /dev/stdin

export ZSH=$HOME/.oh-my-zsh

export GOPATH=$HOME/.go
export RUBYPATH=$HOME/.gem/ruby/2.6.0
export NPMPATH=$HOME/.npm
export PATH=$PATH:$GOPATH/bin:$RUBYPATH/bin:$NPMPATH/bin:$HOME/Scripts

export EDITOR=nvim
export PAGER=less
export TERM=xterm-termite

SAVEHIST=10000
HISTSIZE=10000

ZSH_THEME="spaceship"
SPACESHIP_BATTERY_SHOW=false

plugins=(
        autojump
        colored-man-pages
        fast-syntax-highlighting
        zsh-autosuggestions
        extract
        title
        )

PROMPT_TITLE="$PWD"

zle -N autosuggest-accept
bindkey '^ ' autosuggest-accept

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
alias aur='pacaur'
alias aurin='aur -S --noedit'
alias aurs='aur -Ss'
alias ls='exa'
alias la='exa -a'
alias ll='exa -lh'
alias v='nvim'
alias vim='nvim'
alias vd='nvim -d'
alias vimdiff='nvim -d'
alias top='htop'
alias ip='ip -c'
alias py='python'
alias ssh='sshrc'
alias cat='bat'
alias icat='kitty +kitten icat'
alias d='kitty +kitten diff'
alias lock='betterlockscreen'

alias -g G="| grep -i"

cd() { builtin cd "$@" && ls; }
mkd() { mkdir -p "$@" && cd "$_" }
\=() { bc -l <<< "$@" }

zstyle ':completion:*' menu select
