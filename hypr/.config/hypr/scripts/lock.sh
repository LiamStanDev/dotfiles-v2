#!/bin/bash

timeswaylock=600
timeoff=630

if [ -f "/usr/bin/swayidle" ]; then
    echo "swayidle is installed."
    swayidle -w \
        timeout $timeswaylock 'swaylock -f' \
        timeout $timeoff 'hyprctl dispatch dpms off' \
        resume 'hyprctl dispatch dpms on'\
        before-sleep 'swaylock -f'
else
    echo "swayidle not installed."
fi;
