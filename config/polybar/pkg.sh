#!/bin/bash

pac=$(checkupdates | wc -l)

if [[ "$pac" != "0" ]]; then
    echo "$pac updates"
fi
