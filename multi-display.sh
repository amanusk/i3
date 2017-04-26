#!/bin/bash

xrandr --output LVDS-1 --off \
    --output HDMI-3 --auto --primary \
    --output VGA-1 --auto --right-of HDMI-3
