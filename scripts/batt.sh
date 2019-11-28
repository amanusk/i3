#!/bin/bash

bat0full=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -w energy-full | grep -v design | cut -d":" -f 2 | xargs | cut -d" " -f 1  | bc`
if [ -z "$bat0full"  ]; then
    bat0full=0
fi

bat1full=`upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -w energy-full | grep -v design | cut -d":" -f 2 | xargs | cut -d" " -f 1  | bc`
if [ -z "$bat1full"  ]; then
    bat1full=0
fi
full=`echo $bat0full + $bat1full | bc`

bat0curr=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -w energy: | cut -d":" -f 2 | xargs | cut -d" " -f 1  | bc`
if [ -z "$bat0curr"  ]; then
    bat0curr=0
fi
bat1curr=`upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -w energy: | cut -d":" -f 2 | xargs | cut -d" " -f 1  | bc`
if [ -z "$bat1curr"  ]; then
    bat1curr=0
fi
current=`echo $bat0curr + $bat1curr | bc`
##echo $current
#
RED='\033[0;31m'
NC='\033[0m' # No Color
percent=`echo print $current/$full*100 | perl`
printf "%0.2f%%" $percent

