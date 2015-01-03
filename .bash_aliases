alias s='sudo'
alias please='s $(history -p \!\!)'
alias pls='please'

alias pac='s apt-get'
alias pacsearch='s apt search'
alias addrepo='s add-apt-repository'
alias remrepo='s add-apt-repository --remove'

alias ssh='sshrc'
alias sshx='ssh -X -C'

alias ..='cd ..'

alias shadowon='s shadowvpn -c /etc/shadowvpn/client.conf -s start'
alias shadowoff='s shadowvpn -c /etc/shadowvpn/client.conf -s stop'

alias minimize='xdotool windowminimize $(xdotool getactivewindow)'
