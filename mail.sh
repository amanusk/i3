#!/bin/bash
# if we don't have a file, start at zero
if [ ! -f "/tmp/mail.dat" ] ; then
  monitor_mode="on"
# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/mail.dat`
fi

if [ $monitor_mode = "on" ]; then
        monitor_mode="off"
        `pgrep -f thunderbird | xargs kill -SIGSTOP`
elif [ $monitor_mode = "off" ]; then
        monitor_mode="on"
        `pgrep -f thunderbird | xargs kill -SIGCONT`
fi
echo "${monitor_mode}" > /tmp/mail.dat
