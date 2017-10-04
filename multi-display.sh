#!/bin/bash

xrandr --output LVDS-1 --off \
    --output HDMI-3 --auto --primary \
    --output VGA-1 --auto --right-of HDMI-3

setxkbmap -model pc105 -layout us,il -option grp:alt_shift_toggle
