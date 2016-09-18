#!/bin/bash
EXTERNAL_OUTPUT="HDMI3"
INTERNAL_OUTPUT="LVDS1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="all"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

# Degect extenal monitor
if [ `xrandr | grep VGA1 | grep -c ' connected '` -eq 1 ]; then
	EXTERNAL_OUTPUT="VGA13"
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
if [ `xrandr | grep HDMI3 | grep -c ' connected '` -eq 1 ]; then
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

if [ $monitor_mode = "all" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="CLONES"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
else
        monitor_mode="all"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT
fi
echo "${monitor_mode}" > /tmp/monitor_mode.dat
