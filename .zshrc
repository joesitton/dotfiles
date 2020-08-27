# Zinit
if [ ! -f /etc/zsh/zinit/zinit.zsh ]; then
  git clone https://github.com/zdharma/zinit.git /etc/zsh/zinit
fi

source /etc/zsh/zinit/zinit.zsh

# Plugins
zinit lucid wait"1" light-mode for \
      @zsh-users/zsh-autosuggestions \
      @zsh-users/zsh-history-substring-search \
      @zsh-users/zsh-completions \
      @ael-code/zsh-colored-man-pages \
      @le0me55i/zsh-extract \
      @zdharma/fast-syntax-highlighting \
      @rupa/z

# Ehancd
zinit ice lucid wait"1" pick"init.sh"
zinit light b4b4r07/enhancd

# Programs
zinit lucid wait"1" light-mode from"gh-r" as"program" for \
      mv"exa* -> exa" @ogham/exa \
      mv"docker* -> docker-compose" @docker/compose \
      mv"ripgrep* -> rg" @BurntSushi/ripgrep \
      @junegunn/fzf-bin

# Base16 shell
zinit ice lucid
zinit light chriskempson/base16-shell

# LS_COLORS
zinit ice lucid atclone"dircolors -b LS_COLORS > c.zsh" atpull"%atclone" pick"c.zsh" nocompile"!"
zinit light trapd00r/LS_COLORS

# Prompt
zinit ice lucid from"gh-r" as"program" atload'eval $(starship init zsh)'
zinit load starship/starship

# Zstyles
zstyle ":completion:*" menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Emacs mode
bindkey -e

# Autcomplete 
autoload -Uz compinit && compinit
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
alias _='sudo'
function ..() { __enhancd::cd ..; }
function -() { __enhancd::cd -; }
alias pls='sudo $(fc -ln -1)'

if [ -f "$HOME/.zinit/plugins/ogham---exa/exa" ]; then
  alias ls='exa --color=auto --group-directories-first -F --sort extension'
  alias ll='ls -lh'
  alias la='ll -a'
  alias lS='ll --sort size -r --color-scale'
  alias lt='ls -T -L 2'
else
  alias ls='ls --color=auto --group-directories-first -F -X'
  alias ll='ls -lh'
  alias la='ls -lAh'
fi

alias dps='docker ps --format '\''table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'\'

alias grep='grep --color=auto'
alias rg='rg -i'

alias ap='ansible-playbook'

# Auto-ls
chpwd() { ls; }
