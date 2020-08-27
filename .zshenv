export TERM=xterm-256color

export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin
export PATH="$PATH:$GOBIN"

[ "$(command -v nvim)" ] && export EDITOR=nvim || export EDITOR=vim

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --inline-info"

export WORDCHARS=''
