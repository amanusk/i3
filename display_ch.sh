#!/bin/bash


INTERNAL_OUTPUT="LVDS1"

choices="laptop\ndual\nexternal\nclone"

chosen=$(echo -e $choices | dmenu -i)


# Detect extenal monitor
if [ `xrandr | grep VGA1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="VGA1"
fi
if [ `xrandr | grep DVI1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="DVI1"
fi
if [ `xrandr | grep HDMI1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="HDMI1"
fi
if [ `xrandr | grep HDMI2 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="HDMI2"
fi
if [ `xrandr | grep HDMI-3 | grep c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="HDMI3"
fi
if [ `xrandr | grep DP1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="DP1"
fi
if [ `xrandr | grep DP2 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="DP2"
fi
if [ `xrandr | grep DP3 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="DP2"
fi


case "$chosen" in
    external) xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary && ~/.fehbg;;
    laptop) xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off && ~/.fehbg;;
    clone) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT && ~/.fehbg;;
    dual) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT --primary && ~/.fehbg;;

esac

setxkbmap -model pc105 -layout us,il -option grp:alt_shift_toggle
