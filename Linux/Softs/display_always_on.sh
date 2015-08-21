xscreensaver-command --exit

xset s off ; xset s noblank ; xset s 0 0 ; # xset s 3600 3600
xset dpms standby 0 ; xset dpms suspend 0 ; xset dpms off 0
xset dpms force on ; xset -dpms

setterm -blank 0 ; setterm -powersave off ; setterm -powerdown 0

# echo -ne "\033[9;0]" >> /etc/issue

xset -q
