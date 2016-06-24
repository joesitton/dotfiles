#!/bin/sh

feh --bg-scale --no-fehbg ~/Pictures/bgkmvdJ.jpg &

xrandr --rate 144 &
xcalib -d :0 /usr/share/color/icm/AOC\ G2460PF.icm &
xrdb -load ~/.Xresources &
xsetroot -cursor_name left_ptr &
xset m 0 0 &
xset r rate 300 40 &
xmodmap ~/.Xmodmap &

compton --config ~/.config/compton/compton.conf &

sxhkd &
exec bspwm
