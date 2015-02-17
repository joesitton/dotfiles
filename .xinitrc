#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

feh --bg-scale ~/Pictures/blurredtrees.png &

xrdb -load ~/.Xresources

xset m 5/3
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local
xset fp rehash
xsetroot -cursor_name left_ptr
xsetroot -solid gray20

unclutter -root -idle 3 &
compton -b --config ~/.config/compton/compton.conf &
redshift -l 30:-81 -t 6400:4400 &

sxhkd &
exec bspwm
