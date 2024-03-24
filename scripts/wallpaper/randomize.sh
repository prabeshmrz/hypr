#!/bin/bash

# Define the directory to choose from
if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
  old_wallpaper=$(cat ~/.config/hypr/scripts/.log/wpaper.log)
  files=("$(dirname $old_wallpaper)"/*)
fi

# Get the number of files in the directory
num_files=${#files[@]}

# Choose a random index from the array of files
rand_index=$((RANDOM % num_files))

# Get the random file from the array
random_file="${files[$rand_index]}"

echo $random_file > ~/.config/hypr/scripts/.log/wpaper.log

hyprctl dispatch exec ~/.config/hypr/scripts/wallpaper/change.sh

