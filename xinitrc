# X stuff
xsetroot -cursor_name left_ptr
xset r rate 350 30

# Cursor, background, compositor
unclutter -idle 1 -jitter 2 -root &
feh --bg-fill $HOME/Pictures/fernando-puente-GJYY_5VZB3c-unsplash.jpg
picom -b --config $HOME/.config/picom.conf

# VMWare stuff
vmware-user
vmhgfs-fuse .host:/Downloads ~/Windows

exec bspwm

# vim: set ft=sh:
