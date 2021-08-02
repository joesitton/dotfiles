#!/bin/bash

interface=wlp0s20f3
interval=3

while true; do
    essid="$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d: -f2)"
    proxy="$(echo $http_proxy)"

    if [[ ! -z $proxy ]]; then
        icon="﨩"
    else
        icon=""
    fi

    echo "$icon  $essid"

    sleep $interval
done
