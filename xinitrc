xsetroot -cursor_name left_ptr
xset r rate 350 25 &
xmodmap $HOME/.xmodmap &

exec bspwm
