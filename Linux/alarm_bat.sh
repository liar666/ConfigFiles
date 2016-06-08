#!/usr/bin/env bash

PLUGGED=$(cat /sys/class/power_supply/AC0/online)

CRITICAL_LEVEL=.05
WARNING_LEVEL=.1
REMINDER_LEVEL=.3

pc=$(. ~/Softs/getBATpercent)

if (( x"${PLUGGED}" == x"0" )) ## If the computer is plugged we don't care about the battery level!!
then
    if (( $(bc -l <<< "$pc<${CRITICAL_LEVEL}") ))
    then
        sudo /usr/sbin/pm-suspend
    else if (( $(bc -l <<< "$pc<${WARNING_LEVEL}") ))
         then
             /usr/bin/mplayer -loop 10 "/home/gmuller/.sounds/Droid 1 Alarms/Alarm_Beep_03.ogg" --volume=250
             # Would loop printing a message every minute :{
             #     else if (( $(bc -l <<< "$pc<${REMINDER_LEVEL}") ))
             #          then
             #              /usr/bin/xmessage "BATTERIE IS ${pc}"
             #          fi
         fi
    fi
fi
