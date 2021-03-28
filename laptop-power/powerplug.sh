#!/bin/bash
#echo $1 >> /tmp/power.log

case $1 in
	true)
		export DISPLAY=:0
		echo "On battery" > /tmp/power.log
		sudo -u piepants /usr/bin/xset dpms >> /tmp/power.log
		sudo -u piepants /usr/bin/xset s default >> /tmp/power.log
		/usr/bin/xset q >> /tmp/power.log
		echo 60000 > /sys/class/backlight/intel_backlight/brightness
		;;
	false)
		export DISPLAY=:0
		echo "On AC" > /tmp/power.log
		sudo -u piepants /usr/bin/xset -dpms >> /tmp/power.log 
		sudo -u piepants /usr/bin/xset s off >> /tmp/power.log
		xset q >> /tmp/power.log
		echo 120000 > /sys/class/backlight/intel_backlight/brightness
		;;
	*)
		exit $NA ;;
esac

exit 0
