#!/bin/bash

if [ $HOSTNAME = "wirbelwind" ]; then
	bspc $1 $2 $3 $4
else

	# All this was unnecessary in the end, but I'm leaving it here commented out just in case
	# requirements change in the future.

	#echo $3
	#if (( $3 > 6 )); then
	#	scr=$(expr $3 - 6)
	#else
	#	scr=$3
	#fi
	#echo $1 $2 $3 $4
	#echo "Sending command to bspc..." >> /tmp/workspace.log
	#echo $1 $2 $3 $4 >> /tmp/workspace.log

	bspc $1 $2 $3 $4
fi
