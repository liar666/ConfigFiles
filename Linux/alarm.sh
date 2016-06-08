#!/usr/bin/env bash

## Do not activate the following 2 lines, the user setting in cron is sufficient:
#export DISPLAY=:0
#export XAUTHORITY=/home/gmuller/.Xauthority


# /usr/bin/X11/xterm -display :0 -bg black -fg white -e ""
##whoami >> /tmp/who
##amixer >> /tmp/mixer
##pactl list >> /tmp/pactl
/usr/bin/mplayer -ao pulse -vo null /home/gmuller/.sounds/alarm_clock_short.ogg --volume=250 > /tmp/mplayer_alarm_p 2>&1 # -really-quiet
# /usr/bin/paplay /home/gmuller/.sounds/alarm_clock_short.ogg > /tmp/paplay_alarm 2>&1
# su gmuller -c '/usr/bin/paplay /home/gmuller/.sounds/alarm_clock_short.ogg > /tmp/paplay_alarm 2>&1'
