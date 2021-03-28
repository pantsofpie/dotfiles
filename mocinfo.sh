#!/bin/bash

hbcounter=0

while :
do
	nowplaying=$(mocp -Q "%song" | xargs)
	echo $nowplaying

	if [[ $nowplaying == "" ]]
	then
		((hbcounter=hbcounter+1))
	else
		hbcounter=0
	fi

	if [[ $hbcounter > 4 ]]
	then
		rm /home/piepants/.mocinfo >> /dev/null
	else
		echo $nowplaying > /home/piepants/.mocinfo
	fi
	
	sleep 1

done
