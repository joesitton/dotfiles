# Path to omz
export ZSH=$HOME/.oh-my-zsh

# Prompt theme
ZSH_THEME="cypher"

# Auto correction
ENABLE_CORRECTION="true"

# Plugins
plugins=(wd) 

# Set PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Source omz
source $ZSH/oh-my-zsh.sh

# Source aliases and function files
for f in ~/.{aliases,functions}; do
    source "$f"
done
