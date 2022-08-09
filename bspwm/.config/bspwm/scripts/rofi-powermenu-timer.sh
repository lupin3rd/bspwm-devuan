#!/bin/bash

rofi_command="rofi"

### Options ###
shutdown_5=" Shutdown 5"
shutdown_30=" Shutdown 30"
shutdown_60=" Shutdown 60"
shutdown_180=" Shutdown 180"

suspend_5="鈴 Suspend 5"
suspend_30="鈴 Suspend 30"
suspend_60="鈴 Suspend 60"
suspend_180="鈴 Suspend 180"

cancel="Cancel pending shutdown/suspend"

# Variable passed to rofi
options="$shutdown_5\n$shutdown_30\n$shutdown_60\n$shutdown_180\n\n$suspend_5\n$suspend_30\n$suspend_60\n$suspend_180\n\n$cancel"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $shutdown_5)
        ~/.config/bspwm/scripts/powertimer.sh -h 5 &
        ;;
    $shutdown_30)
        ~/.config/bspwm/scripts/powertimer.sh -h 30 &
        ;;
    $shutdown_60)
        ~/.config/bspwm/scripts/powertimer.sh -h 60 &
        ;;
    $shutdown_180)
        ~/.config/bspwm/scripts/powertimer.sh -h 180 &
        ;;
    $suspend_5)
        ~/.config/bspwm/scripts/powertimer.sh -s 5 &
        ;;
    $suspend_30)
        ~/.config/bspwm/scripts/powertimer.sh -s 30 &
        ;;
    $suspend_60)
        ~/.config/bspwm/scripts/powertimer.sh -s 60 &
        ;;
    $suspend_180)
        ~/.config/bspwm/scripts/powertimer.sh -s 180 &
        ;;
    $cancel)
        [[ $(pidof -x powertimer.sh) ]] && pkill powertimer.sh &
        ;;
esac

