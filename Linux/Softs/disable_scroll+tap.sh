#!/bin/sh
xinput list | sed -ne 's/^[^ ][^V].*id=\([0-9]*\).*/\1/p' | while read id
do
        case `xinput list-props $id` in
        *"Synaptics Off"*)
                xinput set-prop $id "Synaptics Off" 2
                ;;
        esac
done
synclient TouchpadOff=0
synclient LeftEdge=0
synclient RightEdge=1700
synclient TopEdge=0
synclient BottomEdge=1500
synclient VertTwoFingerScroll=0
synclient HorizTwoFingerScroll=0
# Prevents events when typing
synclient PalmDetect=1
#synclient PalmMinWidth=
#synclient PalmMinZ=

# To actually disable TouchPad while tying
syndaemon -d -i 1.2 # was:.9 (.6?)
