#!/bin/bash

lockscreen=300
timeoff=330
suspendtime=600

if [ -f "/usr/bin/swayidle" ]; then
    echo "swayidle is installed."
    swayidle -w \
        timeout $lockscreen 'swaylock' \
        timeout $timeoff 'hyprctl dispatch dpms off' \
        timeout $suspendtime 'systemctl suspend' \
        resume 'hyprctl dispatch dpms on'\
else
    echo "swayidle not installed."
fi;


