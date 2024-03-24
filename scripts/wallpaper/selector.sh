#!/bin/bash

old_wallpaper="$(cat ~/.config/hypr/scripts/.log/wpaper.log)"

kitty -e ranger /e/Pictures/ --choosefile=.config/hypr/scripts/.log/wpaper.log

new_wallpaper=$(cat ~/.config/hypr/scripts/.log/wpaper.log)

if [[ $old_wallpaper != $new_wallpaper ]]; then
  hyprctl dispatch exec ~/.config/hypr/scripts/wallpaper/change.sh
fi
