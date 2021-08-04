#!/bin/sh

xrandr
xmodmap $HOME/.Xmodmap
xset r rate 350 30
xsetroot -xcf /usr/share/icons/capitaine-cursors-light/cursors/left_ptr 32
xrdb $HOME/.Xresources

feh --bg-scale /usr/share/backgrounds/michael-king-bIrEUo3vwcs-unsplash.jpg

sxhkd &
dunst &
pueued &
darkman &
clipcatd &
redshift -t 6500:3500 -l 30:-81 &
unclutter --timeout 5 --ignore-scrolling --jitter 8 &
picom --config $HOME/.config/picom.conf --experimental-backends &

exec bspwm > /var/log/bspwm.log

# vim: ft=sh
