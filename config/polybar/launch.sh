#!/usr/bin/env bash

while killall -9 -q polybar; do sleep 1; done

polybar -q --reload date & disown
xprop -id "$(xdotool search --sync --pid $!)" -set WM_NAME "Polybar-no-bg"

polybar -q --reload time & disown
xprop -id "$(xdotool search --sync --pid $!)" -set WM_NAME "Polybar-no-bg"

polybar --reload main & disown
