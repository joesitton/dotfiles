#!/usr/bin/env bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar bar &
while ! xdo id -N Polybar >/dev/null; do sleep 1; done
xdo raise $(xdo id -N Polybar)

killall -q tint2
while pgrep -u $UID -x tint2 >/dev/null; do sleep 1; done
tint2 &
while ! xdo id -a tint2 >/dev/null; do sleep 1; done
xdo raise $(xdo id -a tint2)

while read -r line; do
    if [[ "$line" =~ (fullscreen on) ]]; then
        xdo lower $(xdo id -N Polybar)
        xdo lower $(xdo id -a tint2)
    elif [[ "$line" =~ (fullscreen off|desktop_focus|node_focus) ]]; then
        xdo raise $(xdo id -N Polybar)
        xdo raise $(xdo id -a tint2)
    fi
done < $(bspc subscribe -f node desktop_focus) &
