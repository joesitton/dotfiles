export TERM=xterm-256color

autoload -U colors && colors
PROMPT="%{$fg_bold[yellow]%}%n%{$reset_color%} %{$fg_bold[white]%}at%{$reset_color%} %{$fg_bold[green]%}$(eval hostname -I | awk '{print $1}')%{$reset_color%} %{$fg_bold[white]%}in%{$reset_color%} %{$fg_bold[cyan]%}%~%{$reset_color%}
%{$fg[green]%}➜%{$reset_color%} "
precmd() { echo ; }

if [ -d $HOME/.oh-my-zsh ]; then
    export ZSH="/home/$USER/.oh-my-zsh"

    plugins=(
        #fast-syntax-highlighting
        docker
        extract
        #vi-mode
        fasd
    )

    source $ZSH/oh-my-zsh.sh
else
    autoload -Uz compinit && compinit
fi

export KEYTIMEOUT=1

if [ -x "$(command -v nvim)" ]; then
    EDITOR=nvim
else
    EDITOR=vim
fi

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

if [[ -f $SSHHOME/.sshrc.d/.zsh_aliases ]]; then
    . $SSHHOME/.sshrc.d/.zsh_aliases
fi

if [[ -f $SSHHOME/.sshrc.d/.zsh_functions ]]; then
    . $SSHHOME/.sshrc.d/.zsh_functions
fi
