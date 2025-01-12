#!/bin/bash

set -o pipefail

# Directory
_SCREENSHOT_DIR_=$HOME/Pictures/Screenshot

# Check save directory
# Create it if it doesn't exist
function check_dir() {
	if [[ ! -d "$_SCREENSHOT_DIR_" ]]; then
		mkdir -p "$_SCREENSHOT_DIR_"
	fi
}

function main() {
    check_dir

    _start_job_=$(date +%s)
    _screenshot_command_="$1"

    $_screenshot_command_ $_SCREENSHOT_DIR_ -f $_start_job_.png> /dev/null 2>&1
}

# Check the args passed
if [ -z "$1" ] || ([ "$1" != 'full' ] && [ "$1" != 'area' ]);
then
	echo "
	Requires an argument:
	area 	- Area screenshot
	full 	- Fullscreen screenshot
	Example:
	./screensht area
	./screensht full
	"
elif [ "$1" = 'full' ];
then
	msg="Full screenshot saved and copied to clipboard!"
	main 'hyprshot -m output -m eDP-1 -o'
elif [ "$1" = 'area' ];
then
	msg='Area screenshot saved and copied to clipboard!'
	main 'hyprshot -m region -o'
fi
