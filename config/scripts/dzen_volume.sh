#!/bin/bash

source $(dirname $0)/dzen_popup_config

IF="Master"
SECS="2"
XPOS="1000"
HEIGHT="30"
WIDTH="250"
BAR_WIDTH="150"
BAR_HEIGHT="2"
ICON='^i(/home/joe/.icons/volume100.xbm)'
MUTEICON='^i(/home/joe/.icons/volume0.xbm)'

PIPE="/tmp/.volume_pipe"

err() {
  echo "$1"
  exit 1
}

usage() {
  echo "usage: dvol [option] [argument]"
  echo
  echo "Options:"
  echo "     -i, --increase - increase volume by \`argument'"
  echo "     -d, --decrease - decrease volume by \`argument'"
  echo "     -t, --toggle   - toggle mute on and off"
  echo "     -h, --help     - display this"
  exit
}

case "$1" in
  '-i'|'--increase')
    [ -z "$2" ] && err "No argument specified for increase."
    [ -n "$(tr -d [0-9] <<<$2)" ] && err "The argument needs to be an integer."
    AMIXARG="${2}%+"
    ;;
  '-d'|'--decrease')
    [ -z "$2" ] && err "No argument specified for decrease."
    [ -n "$(tr -d [0-9] <<<$2)" ] && err "The argument needs to be an integer."
    AMIXARG="${2}%-"
    ;;
  '-t'|'--toggle')
    AMIXARG="toggle"
    ;;
  ''|'-h'|'--help')
    usage
    ;;
  *)
    err "Unrecognized option \`$1', see dvol --help"
    ;;
esac

AMIXOUT="$(amixer -M set "$IF" "$AMIXARG" | tail -n 1)"
MUTE="$(cut -d '[' -f 4 <<<"$AMIXOUT")"
if [ "$MUTE" = "off]" ]; then
  VOL="0"
  ICON="^fg(#b45a5a)$MUTEICON"
else
  VOL="$(cut -d '[' -f 2 <<<"$AMIXOUT" | sed 's/%.*//g')"
fi

if [ ! -e "$PIPE" ]; then
  mkfifo "$PIPE"
  (dzen2 -tw "$WIDTH" -h "$HEIGHT" -x "$XPOS" -fn "$FONT" ${OPTIONS} < "$PIPE"
   rm -f "$PIPE") &
fi

BAR=$(echo "$VOL" | gdbar -fg "$bar_fg" -bg "$bar_bg" -w "$BAR_WIDTH" -h "$BAR_HEIGHT")

(echo "$ICON  $BAR  $VOL%"; sleep "$SECS"  ) > "$PIPE"
