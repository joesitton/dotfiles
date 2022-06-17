#!/bin/sh

xrandr
xset r rate 350 35
xrdb "$HOME/.Xresources"
setxkbmap -option caps:super
xsetroot -xcf /usr/share/icons/capitaine-cursors-light/cursors/left_ptr 32

sxhkd &
dunst &
libinput-gestures &
redshift -t 6500:3200 -l 30:-81 &
picom --config "$HOME/.config/picom.conf" --experimental-backends &
unclutter --timeout 5 --ignore-scrolling &
xidlehook --not-when-audio --timer 600 'systemctl suspend' '' &

feh --bg-scale /usr/share/backgrounds/michael-king-bIrEUo3vwcs-unsplash.jpg

exec bspwm > /var/log/bspwm.log

# vim: ft=sh
