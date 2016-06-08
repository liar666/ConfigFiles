VGA=DP1
LVDS=eDP1
HDMI=HDMI-0

xrandr --output $LVDS --auto
xrandr --output $VGA --auto
xrandr --output $HDMI --auto

xrandr --output $LVDS --left-of $VGA
xrandr --output $HDMI --right-of $LVDS

