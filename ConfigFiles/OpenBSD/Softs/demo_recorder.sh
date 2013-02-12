#recordmydesktop
  # the target to capture
#--windowid <get it with xwininfo>
  # if working with awesome
#--no-wm-check
  # for user interaction
#--pause-shortcut Control+Mod1+p --stop-shortcut Control+Mod1+s
  # for sound
#--device /dev/audio0 --no-sound / --s_quality <-1-10>
  # for video
#--v_bitrate <45000-2000000> --v_quality <0-63> --fps <~25.0?>
  # optimization/speed up capture?
#--on-the-fly-encoding
  # needed in some cases
#--no-cursor         # remove cursor from video
#--delay n[H|h|M|m]  # before start of capture

WID=`xwininfo | grep "Window id" | cut -d':' -f 3 | cut -d' ' -f2`
#recordmydesktop --no-wm-check --no-sound --windowid $WID --on-the-fly-encoding -fps 2.0 --v_quality 25 
recordmydesktop --no-wm-check --s_quality 2 -device /dev/sound0 --windowid $WID --on-the-fly-encoding -fps 2.0 --v_quality 25 
