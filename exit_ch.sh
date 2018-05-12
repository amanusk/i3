#!/bin/sh

choices="lock\nlogout\nsuspend\nhibernate\nreboot\nshutdown"

chosen=$(echo  $choices | dmenu -i)

case "$chosen" in
    lock)
        i3lock -c 101010
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        i3lock -c 101010 && systemctl suspend
        ;;
    hibernate)
        i3lock -c 101010 && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
esac
