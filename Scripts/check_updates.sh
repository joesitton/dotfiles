#!/bin/sh

updates=($(checkupdates))
n=${#updates[*]}
nu=$(($n/4)) # account for 'current_ver -> new_ver' in string

filename=/home/joe/Scripts/cache/updates_available

if [[ $nu -gt 0 ]]; then
    if [[ ! -f $filename ]]; then
        touch $filename
    fi

    for i in $(seq 0 4 $n); do
        echo ${updates[i]} >> $filename
    done
else
    if [[ -f $filename ]]; then
        rm $filename
    fi
fi
