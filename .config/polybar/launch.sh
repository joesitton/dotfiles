#!/usr/bin/env bash

killall -q polybar

polybar -q --reload main & disown
polybar -q --reload date & disown
polybar -q --reload time & disown

rm -f /var/run/user/$UID/bspwm_fifo*

raise_polybar() { xdo raise $(xdo id -N Polybar); }
lower_polybar() { xdo lower $(xdo id -N Polybar); }

while read -r event _ _ wid state status; do
    if [[ "$event" == "node_state" ]]; then
        if [[ "$state $status" == "fullscreen on" ]]; then
            lower_polybar
        elif [[ "$state $status" == "fullscreen off" ]]; then
            raise_polybar
        else
            raise_polybar
        fi
    fi

    if [[ "$event" =~ (desktop|node)_focus ]]; then
        if [[ "$(bspc query -T -n focused | jq -r .client.state)" == "fullscreen" ]]; then
            lower_polybar
        else
            raise_polybar
        fi
    fi
done < $(bspc subscribe -f node_state node_focus desktop_focus) & disown
