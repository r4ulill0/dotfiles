#!/bin/bash
TINPUT=$1
if [[ ! $TINPUT ]]; then
    read -p "[HH]:[MM]:[SS]" -r INPUT
fi

TIMER=$(echo $TINPUT | awk -F:  'NF==3 {print $1*3600+$2*60+$3} NF!=3 {exit 1}');
echo $TIMER
if [[ $TIMER ]]; then
    mpv /usr/share/sounds/freedesktop/stereo/bell.oga;
    echo "sleeping for $TIMER seconds";
    sleep $TIMER;
    echo "awake!";
    mpv /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga;
else
    mpv /usr/share/sounds/freedesktop/stereo/suspend-error.oga
fi
