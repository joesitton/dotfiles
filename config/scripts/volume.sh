#!/bin/sh

source /home/joe/.config/global.conf

PIPE="/tmp/.volume_pipe"

ICON="^fg($BAR_FOREGROUND)^i(/home/joe/.icons/volume100.xbm)"
ICON2="^fg($BAR_FOREGROUND)^i(/home/joe/.icons/volume0.xbm)"

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
MUTE=$(volume | cut -d " " -f 1)

if [ $MUTE = "off" ]; then
    VOLUME=0
    ICON=$ICON2
else
    VOLUME=$(volume | cut -d " " -f 2)
fi

if [ ! -e $PIPE ]; then
    mkfifo $PIPE
    (dzen2 -tw 250 -h 30 -x 1000 -fn $FONT2 $OPTIONS < $PIPE
    rm -f $PIPE) &
fi

BAR=$(echo $VOLUME | gdbar -fg $BAR_COLOR -bg $BAR_FOREGROUND -w 150 -h 2)

(echo "$ICON  ^fg($BAR_FOREGROUND)$BAR  ^fg($BAR_FOREGROUND)$VOLUME%"; sleep 2 ) > $PIPE
