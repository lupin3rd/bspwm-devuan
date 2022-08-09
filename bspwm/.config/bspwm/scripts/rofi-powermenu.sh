#!/bin/bash

rofi_command="rofi"

### Options ###
power_off=" Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend="鈴 Suspend"
log_out=" Logout"
timer=" Program a suspend/shutdown"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out\n\n$timer"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        sudo shutdown -h now
        ;;
    $reboot)
        sudo shutdown -r now
        ;;
    $lock)
        i3lock -t -i ~/.config/bspwm/bg/stallman.png
        ;;
    $suspend)
        i3lock -t -i ~/.config/bspwm/bg/stallman.png
        amixer set Master mute
        sudo pm-suspend
        ;;
    $log_out)
        bspc quit
        ;;
    $timer)
        ~/.config/bspwm/scripts/rofi-powermenu-timer.sh
        ;;
esac

