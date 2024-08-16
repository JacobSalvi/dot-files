#! /bin/sh

chosen=$(printf "Power off\nRestart\nHibernate\nSleep\n" | wofi -dmenu -i -theme-str '@import power.rasi')

case "$chosen" in
    "Power off") echo 1
    ;;
    "Restart") echo 2 or 3
    ;;
    "Hibernate") echo default
    ;;
    "Sleep") echo 5 ;;
    *) exit 1 ;;
esac
