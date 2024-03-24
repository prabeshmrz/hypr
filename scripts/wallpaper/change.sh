#!/bin/bash

new_wallpaper=$(cat ~/.config/hypr/scripts/.log/wpaper.log)

if [[ $XDG_SESSION_TYPE = 'wayland' ]]; then
  swww img "$new_wallpaper"
elif [[ $XDG_SESSION_TYPE = 'xorg' ]]; then
  feh --bg-scale "$new_wallpaper" &
fi

# wal -i "$new_wallpaper" --backend fast-colorthief -n

# killall waybar
# killall dunst
# waybar &
