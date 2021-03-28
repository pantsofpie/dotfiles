#!/bin/bash

DEFAULT_WP=${HOME}/dotfiles/.default_wp

if [[ -f "${HOME}/.wpdyn" ]]; then
	rm ${HOME}/.wpdyn
	kill $(ps aux | grep 'dwall' | awk '{print $2}')
	if [[ -f "${HOME}/.wallpaper" ]]; then
		if [[ -f "${HOME}/.wptoggle" ]]; then
			feh --bg-fill $DEFAULT_WP
		else
			feh --bg-fill ${HOME}/.wallpaper
		fi
	else
		feh --bg-fill $DEFAULT_WP
	fi
else
	dwall -s firewatch 2>&1 &
	echo 1 > ${HOME}/.wpdyn
fi

