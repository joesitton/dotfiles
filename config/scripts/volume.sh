#!/bin/sh

source ~/.config/scripts/popup.conf
xset r rate 200 15

PIPE="/tmp/.volume_pipe"

ICON="^fg(#$POP_FG)^i(/home/joe/.icons/volume100.xbm)"
ICON2="^fg(#$POP_FG)^i(/home/joe/.icons/volume0.xbm)"

case $1 in
    "-i"|"--increase")
        $(volume raise)
        ;;
    "-d"|"--decrease")
        $(volume lower)
        ;;
    "-t"|"--toggle")
        $(volume toggle)
        ;;
esac

AMIXER=$(amixer -M set Master $VOLUME | tail -n 1)
MUTE=$(volume status | cut -d " " -f 1)

if [ $MUTE = "off" ]; then
    VOLUME=0
    ICON=$ICON2
else
    VOLUME=$(volume status | cut -d " " -f 2)
fi

if [ ! -e $PIPE ]; then
    mkfifo $PIPE
    (dzen2 -tw 250 -h 20 -x 1000 -fn $FONT2 -x $POP_X -y $POP_Y < $PIPE
    rm -f $PIPE) &
fi

BAR=$(echo $VOLUME | gdbar -fg "#$POP_BAR_COLOR" -bg "#$POP_BG" -w 200 -h 15)

(echo "   $ICON   ^fg(#$POP_FG)$BAR"; sleep 2 ) > $PIPE
xset r rate 300 40
