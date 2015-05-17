#!/bin/bash

source $(dirname $0)/dzen_popup_config

SECS="2"
XPOS="1000"
YPOS="30"
HEIGHT="30"
WIDTH="250"
BAR_WIDTH="150"
BAR_HEIGHT="2"
ICON='^fg(#cccccc)^i(/home/joe/.icons/brightness.xbm)'

PIPE="/tmp/.brightness_pipe"

err() {
  echo "$1"
  exit 1
}

usage() {
  echo "usage: dvol [option]"
  echo
  echo "Options:"
  echo "     up - increase brightness "
  echo "     down - decrease brightness"
  echo "     -h, --help     - display this"
  exit
}

#Argument Parsing

CURR=$(< /sys/class/backlight/intel_backlight/brightness)
MAX=$(< /sys/class/backlight/intel_backlight/max_brightness)

case $1 in
    up)
        if [[ $CURR -lt $MAX ]]; then
            CURR=$((CURR+10))
            echo $CURR > /sys/class/backlight/intel_backlight/brightness
        fi
    ;;
    down)
        if [[ $CURR -gt 0 ]]; then
            CURR=$((CURR-10))
            echo $CURR > /sys/class/backlight/intel_backlight/brightness
        fi
    ;;
    ''|'-h'|'--help')
        usage
    ;;
    *)
        err "Unrecognized option \`$1', see --help"
    ;;
esac

PERC=$((CURR*100/MAX))

if [ ! -e "$PIPE" ]; then
  mkfifo "$PIPE"
  (dzen2 -tw "$WIDTH" -h "$HEIGHT" -x "$XPOS" -fn "$FONT" ${OPTIONS} < "$PIPE"
   rm -f "$PIPE") &
fi

BAR=$(echo "$PERC" | gdbar -fg "$bar_fg" -bg "#dddddd" -w "$BAR_WIDTH" -h "$BAR_HEIGHT")

(echo "$ICON  $BAR  ^fg(#cccccc)$PERC%"; sleep "$SECS"  ) > "$PIPE"
