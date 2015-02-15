#!/bin/bash

LINES=5
WIDTH=350
#XPOS=900

source $(dirname $0)/dzen_popup_config

source $(dirname $0)/mouselocation.sh

(echo "Diskinfo"
echo " "
for x in {1}; do
    MOUNT=$(df -h | grep "sda1" | awk '{gsub(/\/.*\//,"/",$6);print $6}')
    TOTAL=$(df -h | grep "sda1" | awk '{print $2}')
    USED=$(df -h | grep "sda1" | awk '{print $3}')
    AVAIL=$(df -h | grep "sda1" | awk '{print $4}')
    USE=$(df -h | grep "sda1" | awk '{gsub(/%/,"");print $5}')
    if [ "$USE" -gt 75 ]; then
        BAR=$(echo "$USE" | gdbar -bg $bar_bg -fg $warn -h 2 -w 130)
    else
        BAR=$(echo "$USE" | gdbar -bg $bar_bg -fg $bar_fg -h 2 -w 130)
    fi
    echo -e "$PAD ^fg(${label})$(printf '%-6s' $MOUNT)^fg() $BAR  $USED / $TOTAL ($AVAIL free)$PAD"
done) | dzen2 -p "$TIME" -x "$XPOS" -w "$WIDTH" -l "$LINES" -sa 'l' -title-name "popup_diskinfo" -fn "$FONT" ${OPTIONS}
