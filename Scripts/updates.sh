#!/bin/sh

file=/home/joe/Scripts/cache/updates_available

if [[ -f $file ]]; then
    echo "%{F#e8e8e8}$(cat $file | wc -l)%{F-}"
else
    echo ""
fi
