#!/bin/bash

xrandr --output LVDS-1 --off --output HDMI-3 --auto --primary
sleep 1
xrandr --output HDMI-2 --auto --right-of HDMI-3

setxkbmap -model pc105 -layout us,il -option grp:alt_shift_toggle
