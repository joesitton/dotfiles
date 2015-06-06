#!/bin/sh

source ~/.config/scripts/popup.conf

PIPE="/tmp/.volume_pipe"

ICON="^fg(#$POP_FOREGROUND)^i(/home/joe/.icons/volume100.xbm)"
ICON2="^fg(#$POP_FOREGROUND)^i(/home/joe/.icons/volume0.xbm)"

case $1 in
    "-i"|"--increase")
        VOLUME="$2%+"
        ;;
    "-d"|"--decrease")
        VOLUME="$2%-"
        ;;
    "-t"|"--toggle")
        VOLUME="toggle"
        ;;
esac

AMIXER=$(amixer -M set Master $VOLUME | tail -n 1)
MUTE=$(amixer get Master | grep Mono: | cut -d " " -f 8 | tr -d "[]")

if [ $MUTE = "off" ]; then
    VOLUME=0
    ICON=$ICON2
else
    VOLUME=$(amixer get Master | grep Mono: | cut -d " " -f 6 | tr -d "[]%")
fi

if [ ! -e $PIPE ]; then
    mkfifo $PIPE
    (dzen2 -tw 250 -h 30 -x 1000 -fn $FONT2 -x $POP_X -y $POP_Y < $PIPE
    rm -f $PIPE) &
fi

BAR=$(echo $VOLUME | gdbar -fg "#$POP_BAR_COLOR" -bg "#$POP_FOREGROUND" -w 150 -h 2)

(echo "$ICON  ^fg(#$POP_FOREGROUND)$BAR  ^fg(#$POP_FOREGROUND)$VOLUME%"; sleep 2 ) > $PIPE
