#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
echo "waiting for polybar to die"
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch top bar
echo "starting polybar"
polybar top --reload & > /var/log/polybar.log

# Wait for process to spawn
while ! xdo id -N Polybar >/dev/null; do sleep 1; done

wid=$(xdo id -N Polybar)
echo "wid: $wid"

echo "raising polybar"
xdo raise $wid
