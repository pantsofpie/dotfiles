#!/bin/bash

DEFAULT_WP=${HOME}/dotfiles/.default_wp

if [[ -f "${HOME}/.wpdyn" ]]; then
	exit 0
fi

if [[ -f "${HOME}/.wallpaper" ]]; then
	if [[ -f "${HOME}/.wptoggle" ]]; then
		feh --bg-fill ${HOME}/.wallpaper			# Custom wallpaper
		rm ${HOME}/.wptoggle
	else
		feh --bg-fill $DEFAULT_WP
		echo 1 > ${HOME}/.wptoggle
	fi
fi

