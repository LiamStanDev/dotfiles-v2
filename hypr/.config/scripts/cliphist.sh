#!/bin/bash

case $1 in 
    d) cliphist list | rofi -dmenu -theme ~/.config/rofi/launchers/type-1/style-3.rasi | cliphist delete
       ;;

    *) pkill rofi || cliphist list | rofi -dmenu -theme ~/.config/rofi/launchers/type-1/style-3.rasi | cliphist decode | wl-copy # clipboard manager
       ;;
esac
