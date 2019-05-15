xsetroot -cursor_name left_ptr
xset r rate 350 25
xmodmap $HOME/.xmodmap

feh --bg-fill $HOME/Pictures/yosemite.jpg

dunst &
mpd &
redshift -t 5500:3000 &
compton -b
copyq &
musnify-mpd -p 6601 &

exec bspwm

# vim: set ft=sh:
