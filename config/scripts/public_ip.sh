#!/bin/bash

source $(dirname $0)/dzen_popup_config

SECS="3"
XPOS="1000"
HEIGHT="30"
WIDTH="250"
BAR_WIDTH="150"
BAR_HEIGHT="2"
ICON='^fg(#2aa198)^i(/home/joe/.icons/wireless.xbm)'

PIPE="/tmp/.public_ip_pipe"

if [ ! -f $PIPE ]; then
    rm -f $PIPE
fi

if [ ! -e "$PIPE" ]; then
  mkfifo "$PIPE"
  (dzen2 -tw "$WIDTH" -h "$HEIGHT" -x "$XPOS" -fn "$FONT" ${OPTIONS} < "$PIPE"
   rm -f "$PIPE") &
fi

(echo "$ICON  ^fg(#cccccc)$(curl -s curlmyip.de)"; sleep "$SECS"  ) > "$PIPE"
