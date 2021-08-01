#!/bin/sh

xrandr
xmodmap $HOME/.Xmodmap
xset r rate 350 30
xsetroot -xcf /usr/share/icons/capitaine-cursors-light/cursors/left_ptr 32
xrdb $HOME/.Xresources

sxhkd &
dunst &
darkman &
greenclip daemon &
nitrogen --restore &
unclutter --timeout 5 &
redshift -t 6500:3500 -l 30:-81 &
picom --config $HOME/.config/picom.conf --experimental-backends &

exec bspwm >> /var/log/bspwm.log

# vim: ft=sh
