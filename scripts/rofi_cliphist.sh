#!/bin/bash

cliphist list | rofi -dmenu "$@" -theme $HOME/.config/rofi/launchers/type-1/style-5.rasi -l 10 -p "Clip History:"  | cliphist decode | wl-copy
