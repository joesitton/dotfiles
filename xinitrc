xsetroot -cursor_name left_ptr
xset r rate 350 25
xmodmap $HOME/.xmodmap

feh --bg-fill $HOME/Pictures/yosemite.jpg

dunst &
mpd &
redshift -l 28:-80 -t 5500:2500 &
compton &
copyq &
musnify-mpd &

exec bspwm

# vim: set ft=sh:
