#!/bin/sh

# Background
feh --no-fehbg --bg-scale ~/Pictures/Absence.jpg &

# Xresources
xrdb -load ~/.Xresources

# Trackpad/mouse speed
xset m 5/3

# Keyboard repeat rate
xset r rate 300 40

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

sxhkd &
exec bspwm
