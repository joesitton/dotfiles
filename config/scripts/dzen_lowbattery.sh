#!/bin/bash

source $(dirname $0)/dzen_popup_config

#Customize this stuff
SECS="5"            # sleep $SECS
XPOS="1000"          # horizontal positioning
HEIGHT="30"         # window height
WIDTH="250"         # window width
BAR_WIDTH="150"     # width of volume bar
BAR_HEIGHT="2"     # height of volume bar
ICON='^fg(#b45a5a)^i(/home/joe/.icons/batt5empty.xbm)^fg(#c0b18b)'

#Probably do not customize
PIPE="/tmp/.dzen_battery_pipe"

#Also prevents multiple volume bar instances
if [ ! -e "$PIPE" ]; then
  mkfifo "$PIPE"
  (dzen2 -tw "$WIDTH" -h "$HEIGHT" -x "$XPOS" -fn "$FONT" ${OPTIONS} < "$PIPE"
   rm -f "$PIPE") &
fi

#Feed the pipe!
(echo "$ICON  $(cat /sys/class/power_supply/BAT0/capacity)% power low"; sleep "$SECS" ) > "$PIPE"
