# Zinit
if [ ! -f /etc/zinit/zinit.zsh ]; then
  git clone https://github.com/zdharma/zinit.git /etc/zinit
fi

source /etc/zinit/zinit.zsh

# Plugins
zinit lucid wait"1" light-mode for \
      @zsh-users/zsh-autosuggestions \
      @zsh-users/zsh-history-substring-search \
      @zdharma/fast-syntax-highlighting \
      @ael-code/zsh-colored-man-pages \
      @le0me55i/zsh-extract \
      @jreese/zsh-titles

# Auto jump
zinit ice lucid atload"touch $HOME/.z"
zinit light rupa/z

# LS_COLORS
zinit ice lucid atclone"dircolors -b LS_COLORS > c.zsh" atpull"%atclone" pick"c.zsh" nocompile"!"
zinit light trapd00r/LS_COLORS

# Prompt
zinit ice lucid from"gh-r" as"program" atload'eval $(starship init zsh)'
zinit load starship/starship

# Shell
zinit ice lucid
zinit light chriskempson/base16-shell

# Zstyles
zstyle ":completion:*" menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Emacs mode
bindkey -e

# Autcomplete
autoload -Uz compinit && compinit -u
zmodload zsh/complist

# Keybindings
bindkey '^ ' autosuggest-execute

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey -M menuselect '^[[Z' reverse-menu-complete

# Edit commands in vim
autoload -U edit-command-line
zle -N edit-command-line

bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# History
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=$HOME/.zsh_history

# Options
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt extended_glob
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt interactive_comments
unsetopt flowcontrol
unsetopt menu_complete

# Aliases
function ..() { cd ..; }
function -() { cd -; }

alias _='sudo'
alias pls='sudo $(fc -ln -1)'

if [ "$(command -v exa)" ]; then
  alias ls='exa --color=auto --group-directories-first -F --sort extension'
  alias ll='ls -lhg'
  alias la='ll -a'
  alias lS='ll --sort size -r --color-scale'
  alias lt='ls -T -L 3 -I "node_modules|venv|__pycache__"'
else
  alias ls='ls --color=auto --group-directories-first -F -X'
  alias ll='ls -lh'
  alias la='ls -lAh'
fi

[ "$(command -v nvim)" ] && alias vim='nvim'

alias grep='grep --color=auto -i'
alias rg='rg -i'
alias ssh='ssh -xC'
alias yarn='yarn --emoji true'

alias ap='ansible-playbook'
alias ac='ansible-console'

alias count="rev | cut -d '.' -f1 | rev | sort | uniq -c | sort -bgr"

alias dps='docker ps --format '\''table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'\'
alias drm='docker images | grep none | awk '\''{print $3}'\'' | xargs docker rmi -f'

alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline'

# Auto-ls
chpwd() { ls; }

# vim: ft=zsh
