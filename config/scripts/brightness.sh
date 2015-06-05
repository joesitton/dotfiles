#!/bin/sh

source /home/joe/.config/global.conf

PIPE="/tmp/.brightness_pipe"

ICON="^fg($BAR_FOREGROUND)^i(/home/joe/.icons/brightness.xbm)"

CURRENT=$(< /home/joe/.config/scripts/brightness)
MAXIMUM=$(< /home/joe/.config/scripts/max_brightness)

case $1 in
    "up")
        if [[ $CURRENT -lt $MAXIMUM ]]; then
            CURRENT=$((CURRENT + 10))
            echo $CURRENT > /home/joe/.config/scripts/brightness
        fi
    ;;
    "down")
        if [[ $CURRENT -gt 0 ]]; then
            CURRENT=$((CURRENT - 10))
            echo $CURRENT > /home/joe/.config/scripts/brightness
        fi
    ;;
esac

PERCENT=$((CURRENT * 100 / MAXIMUM))

if [ ! -e $PIPE ]; then
    mkfifo $PIPE
    (dzen2 -tw 250 -h 30 -x 1000 -fn $FONT2 $OPTIONS < $PIPE
    rm -f $PIPE) &
fi

BAR=$(echo $PERCENT | gdbar -fg $BAR_COLOR -bg $BAR_FOREGROUND -w 150 -h 2)

(echo "$ICON  $BAR  ^fg($BAR_FOREGROUND)$PERCENT%"; sleep 3 ) > $PIPE
