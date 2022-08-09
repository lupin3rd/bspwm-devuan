#!/bin/bash

bg_dir=~/.config/bspwm/bg
rofi_command="rofi"

### Options ###
random="Random background"
images=$(find ~/.config/bspwm/bg/* -maxdepth 0 -type f -printf "%f\n")

# Variable passed to rofi
options="$random\n\n$images"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"

case $chosen in
    $random)
        random_file=$(find ~/.config/bspwm/bg/* -maxdepth 0 -type f |sort -R |tail -1)
        wal -n -i $random_file &
        feh --bg-scale $random_file &
        ;;
    "")
        ;;
    *)
        wal -n -i $bg_dir/$chosen &
        feh --bg-scale $bg_dir/$chosen &
        ;;
esac

