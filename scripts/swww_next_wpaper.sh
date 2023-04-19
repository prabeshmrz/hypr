#!/bin/bash

# Define the directory to choose from
if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <dir containg images>"
	exit 1
fi

if [[ $2 ]]; then

  # Create an array of all the files in the directory
  files=("$1"/*)

  # Get the number of files in the directory
  num_files=${#files[@]}

  # Choose a random index from the array of files
  rand_index=$((RANDOM % num_files))

  # Get the random file from the array
  random_file="${files[$rand_index]}"

  echo $random_file > ~/.config/hypr/scripts/.log/wpaper.log

fi

while read file; do random_file=$file; done < ~/.config/hypr/scripts/.log/wpaper.log

# Output the random file
swww img "$random_file"
