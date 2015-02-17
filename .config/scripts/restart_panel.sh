#!/bin/bash

pkill -x bspwm_panel.sh
pkill bar
pkill conky

# launch panel
~/.config/bspwm/panel/panel &
