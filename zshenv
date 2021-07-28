# Language things
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Terminal
export TERM=xterm-256color

# PATH
export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin
export SNAPPATH=/var/lib/snapd/snap/bin
export CARGOPATH=$HOME/.cargo/bin

export PATH="$PATH:$GOBIN:$SNAPPATH:$ANDROID_SDK_ROOT:$CARGOPATH"

# Editor
[ "$(command -v nvim)" ] && export EDITOR=nvim || export EDITOR=vim

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!{node_modules,.git}'"
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --inline-info --preview 'cat {}'"

# Ctrl-W backspace word
export WORDCHARS=""

# Android SDK
export ANDROID_SDK_ROOT=/opt/android-sdk
export JAVA_HOME='/usr/lib/jvm/java-10-jdk'
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
