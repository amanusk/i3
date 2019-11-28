#!/bin/bash


INTERNAL_OUTPUT="LVDS-1"

choices="laptop\ndual\nexternal\nclone"

chosen=$(echo -e $choices | dmenu -i)


# Detect extenal monitor
if [ `xrandr | grep VGA-1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="VGA-1"
fi
if [ `xrandr | grep DVI-1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="DVI-1"
fi
if [ `xrandr | grep HDMI-1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="HDMI-1"
fi
if [ `xrandr | grep HDMI-2 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="HDMI-2"
fi
if [ `xrandr | grep HDMI-3 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="HDMI-3"
fi
if [ `xrandr | grep DP1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="DP-1"
fi
if [ `xrandr | grep DP-2 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="DP-2"
fi
if [ `xrandr | grep DP-3 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="DP-2"
fi


case "$chosen" in
    external) xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary && ~/.fehbg;;
    laptop) xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off && ~/.fehbg;;
    clone) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT && ~/.fehbg;;
    dual) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT --primary && ~/.fehbg;;

esac

setxkbmap -model pc105 -layout us,il -option grp:alt_shift_toggle
