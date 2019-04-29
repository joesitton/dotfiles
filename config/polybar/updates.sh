#!/bin/sh

updates=$(checkupdates | wc -l)

if [ "$updates" -gt 0 ]; then
    echo "%{F#e8e8e8}$updates%{F-}"
else
    echo ""
fi
