#!/bin/bash
#
shopt -s nullglob globstar

# switch for autotyping
typeit=0
if [[ $1 == "--type" ]]; then
    typeit=1
    shift
fi

if [[ -n $WAYLAND_DISPLAY ]]; then
	xdotool="ydotool type --file -"
elif [[ -n $DISPLAY ]]; then
	xdotool="xdotool type --clearmodifiers --file -"
else
	echo "Error: No Wayland or X11 display detected" >&2
	exit 1
fi


# get all the saved password files
prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

# shows a list of all password files and saved the selected one in a variable -theme ~/dotfiles/i3/rofi.rasi
password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu "$@" -theme $HOME/.config/rofi/launchers/type-1/style-5.rasi)
[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
  pass show -c "$password" | head -n1  2>/dev/null
else
	pass show "$password" | { IFS= read -r pass; printf %s "$pass"; } | $xdotool
fi
