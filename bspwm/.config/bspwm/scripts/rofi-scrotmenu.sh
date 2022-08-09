#!/bin/bash

rofi_command="rofi"

### Options ###
screen=" Screen"
area=" Area"
window=" Window"
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; scrot ~/Pictures/$(date +%Y%m%d-%H%M%S)-screenshot.png
        ;;
    $area)
        scrot -s ~/Pictures/$(date +%Y%m%d-%H%M%S)-area.png
        ;;
    $window)
        sleep 1; scrot -u ~/Pictures/$(date +%Y%m%d-%H%M%S)-window.png
        ;;
esac

