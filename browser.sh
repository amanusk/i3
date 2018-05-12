#!/bin/bash
# if we don't have a file, start at zero
if [ ! -f "/tmp/browser.dat" ] ; then
  monitor_mode="on"
# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/browser.dat`
fi

if [ $monitor_mode = "on" ]; then
        monitor_mode="off"
        `pgrep -f firefox | xargs kill -SIGSTOP`
elif [ $monitor_mode = "off" ]; then
        monitor_mode="on"
        `pgrep -f firefox | xargs kill -SIGCONT`
fi
echo "${monitor_mode}" > /tmp/browser.dat
