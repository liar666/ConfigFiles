#!/bin/bash

offstatus=$(synclient | grep -F TouchpadOff | sed -rn "s/.*([0-9]).*/\1/p")

echo "${offstatus}"

if [[ x"1" == x"${offstatus}" ]]
then
    echo "ENabling Mousepad"
    . ~/Softs/enable_mousepad
else
    echo "DISabling Mousepad"
    . ~/Softs/disable_mousepad
fi
