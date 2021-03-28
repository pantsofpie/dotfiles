#!/bin/bash

rm /tmp/lockblur.png
rm /tmp/lockblur2.png

RES=`xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'`

if [[ $RES == "5120x1080" ]]; then
	RES="2560x1080"
	DUAL="yes"
else
	DUAL="no"
fi

DEFAULT_WP=${HOME}/dotfiles/.default_wp

if [[ -f "${HOME}/.wallpaper" ]]; then
	if [[ -f "${HOME}/.wptoggle" ]]; then
		convert $DEFAULT_WP -blur 0x5 -resize ${RES}^ -gravity center -extent ${RES} /tmp/lockblur.png
		echo "default wp used while .wallpaper exists"
	else
		convert ${HOME}/.wallpaper -blur 0x5 -resize ${RES}^ -gravity center -extent ${RES} /tmp/lockblur.png
		echo "using .wallpaper"
	fi
else
	convert $DEFAULT_WP -blur 0x5 -resize ${RES}^ -gravity center -extent ${RES} /tmp/lockblur.png
	echo "using default"
fi

if [[ $DUAL = "yes" ]]; then
	convert /tmp/lockblur.png /tmp/lockblur.png +append /tmp/lockblur2.png
else
	cp /tmp/lockblur.png /tmp/lockblur2.png
fi

i3lock -i /tmp/lockblur2.png
