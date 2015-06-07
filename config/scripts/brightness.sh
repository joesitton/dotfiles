#!/bin/sh

source ~/.config/scripts/popup.conf
xset r rate 200 15

PIPE="/tmp/.brightness_pipe"

ICON="^fg(#$POP_FG)^i(/home/joe/.icons/brightness.xbm)"

CURRENT=$(< /home/joe/.config/scripts/brightness)
MAXIMUM=$(< /home/joe/.config/scripts/max_brightness)

case $1 in
    "up")
        if [[ $CURRENT -lt $MAXIMUM ]]; then
            CURRENT=$((CURRENT + 15))
            echo $CURRENT > /home/joe/.config/scripts/brightness
        fi
    ;;
    "down")
        if [[ $CURRENT -gt 0 ]]; then
            CURRENT=$((CURRENT - 15))
            echo $CURRENT > /home/joe/.config/scripts/brightness
        fi
    ;;
esac

PERCENT=$((CURRENT * 100 / MAXIMUM))

if [ ! -e $PIPE ]; then
    mkfifo $PIPE
    (dzen2 -tw 250 -h 20 -x 1000 -fn $FONT2 -x $POP_X -y $POP_Y < $PIPE
    rm -f $PIPE) &
fi

BAR=$(echo $PERCENT | gdbar -fg "#$POP_BAR_COLOR" -bg "#$POP_BG" -w 200 -h 15)

(echo "   $ICON   $BAR"; sleep 3 ) > $PIPE
xset r rate 300 40
