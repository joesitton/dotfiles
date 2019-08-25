export TERM=xterm-256color

export ZSH="/home/joe/.oh-my-zsh"

ZSH_THEME="spaceship"

SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ORDER=(user dir host git node docker line_sep vi_mode jobs char)
SPACESHIP_RPROMPT_ORDER=(exit_code exec_time)

plugins=(
    colored-man-pages
    fast-syntax-highlighting
    docker
    extract
    #vi-mode
    fasd
)

source $ZSH/oh-my-zsh.sh

#autoload -Uz history-search-end

#bindkey "^[[Z" reverse-menu-complete
#bindkey "^[OA" up-line-or-beginning-search
#bindkey "^[OB" down-line-or-beginning-search
#bindkey -M vicmd "k" up-line-or-beginning-search
#bindkey -M vicmd "j" down-line-or-beginning-search

export KEYTIMEOUT=1
export EDITOR="nvim"

SAVEHIST=1000
HISTSIZE=1000

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

if [[ -f $HOME/.zsh_aliases ]]; then
    . $HOME/.zsh_aliases
fi

if [[ -f $HOME/.zsh_functions ]]; then
    . $HOME/.zsh_functions
fi
