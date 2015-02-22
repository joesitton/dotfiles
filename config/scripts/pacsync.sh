#!/bin/sh

file=~/.pacsync.info

sudo pacman -Sy

if [ -f $file ]; then
    rm $file
fi

list=`pacman -Quq`

for x in $list; do
    echo $x >> $file
done
