(run_only_once "xbindkeys -f ~/.xbindkeysrc") &
setxkbmap fr -option ctrl:swapcaps -option compose:rwin
numlockx on
xmodmap .Xmodmap  ### incompatible with xbindkeys
