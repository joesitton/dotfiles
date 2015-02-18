#!/bin/sh

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

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
unclutter -root -idle 3 &
compton -b --config ~/.config/compton/compton.conf &
redshift -l 30:-81 -t 6400:4400 &

sxhkd &
exec bspwm
