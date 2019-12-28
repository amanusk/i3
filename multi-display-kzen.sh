#!/bin/bash

xrandr --output DP-1 --auto --primary --rate 144 --mode 1920x1080 --output LVDS-1 --off

setxkbmap -model pc105 -layout us,il -option grp:alt_shift_toggle
