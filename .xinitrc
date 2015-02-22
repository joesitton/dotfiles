#!/bin/sh

# Background
feh --bg-scale ~/Pictures/blurredtrees.png &

# Xresources
xrdb -load ~/.Xresources

# Trackpad/mouse speed
xset m 5/3

# Fonts
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Cursor
xsetroot -cursor_name left_ptr

# Other
unclutter -noevents -idle 3 &
compton -b --config ~/.config/compton/compton.conf &
redshift -l 30:-81 -t 6400:3400 &
systemctl restart brightness-fix.service

# Volume
amixer set Master on
amixer set Speaker on
amixer set Headphone on

amixer set Speaker 100
amixer set Headphone 100

sxhkd &
exec bspwm
