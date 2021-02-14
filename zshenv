export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TERM=xterm-256color

export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin
export SNAPPATH=/var/lib/snapd/snap/bin
export ANDROID_SDK_ROOT=/opt/android-sdk

export PATH="$PATH:$GOBIN:$SNAPPATH:$ANDROID_SDK_ROOT"

[ "$(command -v nvim)" ] && export EDITOR=nvim || export EDITOR=vim

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --inline-info"

export WORDCHARS=''
