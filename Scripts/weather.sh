#!/bin/sh

file=/home/joe/Scripts/cache/daily_summary

if [[ -f $file ]]; then
    echo "$(head -n1 $file)"
fi
