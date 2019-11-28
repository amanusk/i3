#!/bin/bash

xrandr --output DP-1 --off \
    --output LVDS-1 --auto --primary

setxkbmap -model pc105 -layout us,il -option grp:alt_shift_toggle
