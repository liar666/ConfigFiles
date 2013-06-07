#!/bin/bash 

XMESSAGE=/usr/X11R6/bin/xmessage

if [[ "$#" -le "1" ]] 
then  
  echo "Usage: $0 [<MM/DD/YY>] <hour:minutes> \"<message>\"" 
else if [[ "$#" -eq "2" ]] 
  then  
    echo 'export DISPLAY=:0.0 ; '$XMESSAGE' " ************** '$2' ************"' | at "$1" 
  else 
    echo 'export DISPLAY=:0.0 ; '$XMESSAGE' " ************** '$3' ************"' | at "$2" "$1" 
  fi 
fi
