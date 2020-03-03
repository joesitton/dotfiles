export GOPATH=$HOME/go/bin
export RUSTPATH=$HOME/.cargo/bin
export PATH=$PATH:$GOPATH:$RUSTPATH

export TERM=xterm-256color
export ZSH="/home/$USER/.oh-my-zsh"

export KEYTIMEOUT=1

plugins=(
    fast-syntax-highlighting
    docker
    extract
    z
)

fpath+=($ZSH/plugins/docker)
source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

if [ -x "$(command -v nvim)" ]; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

SAVEHIST=5000
HISTSIZE=5000
HISTFILE=~/.zsh_history

setopt nobeep
setopt auto_cd
setopt pushd_ignore_dups
setopt extended_glob
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt always_to_end
setopt auto_menu
setopt auto_name_dirs
setopt complete_in_word
setopt correct
setopt prompt_subst
setopt multios
setopt auto_menu
unsetopt menu_complete
unsetopt correct_all

if [ -f $HOME/.zsh_aliases ]; then
    . $HOME/.zsh_aliases
fi

if [ -f $HOME/.zsh_functions ]; then
    . $HOME/.zsh_functions
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

chpwd() {
    emulate -L zsh
    ls
}

eval "$(starship init zsh)"
