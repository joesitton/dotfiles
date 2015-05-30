#!/bin/sh

# Background
feh --bg-scale --no-fehbg /home/joe/Pictures/.wallhaven

# Xresources
xrdb -load ~/.Xresources

# Trackpad/mouse speed
xset m 5/3

# Keyboard repeat rate
xset r rate 300 40

# Fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Cursor
xsetroot -cursor_name left_ptr

# Other
compton -b --config ~/.config/compton/compton.conf &
redshift -l 30:-81 -t 6400:3400 &

# Volume
amixer set Master on &
amixer set Headphone on &
amixer set Speaker on &

amixer set Headphone 100 &
amixer set Speaker 100 &

# Start DE/WM
sxhkd &
exec bspwm
