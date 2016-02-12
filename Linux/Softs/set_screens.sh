# xrandr --output LVDS-0 --mode "1366x768"
# xrandr --output VGA-0  --mode "1600x900"
xrandr --output LVDS-0 --auto --output VGA-0 --auto --right-of LVDS-0

# Set default brigthness
# !!!gamma values reported by "xrandr --verbose" are the invert of the value set!!!
xrandr --output VGA-0  --brightness 1.0 --gamma 1.0:1.0:.6
xrandr --output LVDS-0 --brightness 1.0 --gamma 1.0:1.0:.6
xgamma -screen LVDS-0 -rgamma 1.0 -ggamma 1.0 -bgamma 0.6
xgamma -screen VGA-0  -rgamma 1.0 -ggamma 1.0 -bgamma 0.6

# Decrease LVDS's brigthness to a little less than VGA so that they look the same
xbacklight -set 40

# xrandr --output LVDS-0 --set BACKLIGHT_CONTROL {combination, native, legacy,kernel}
# xrandr --output LVDS-0 --set BACKLIGHT 1001
# xrandr --output VGA-0  --set BACKLIGHT_CONTROL {combination, native, legacy,kernel}
# xrandr --output VGA-0  --set BACKLIGHT 1001


# ----------------------------------------------------------------------

# xrandr --output LVDS1 --mode "1366x768"
# xrandr --output VGA1  --mode "1600x900"
xrandr --output LVDS1 --auto --output VGA1 --auto --right-of LVDS1

# Set default brigthness
# !!!gamma values reported by "xrandr --verbose" are the invert of the value set!!!
xrandr --output VGA1  --brightness 1.0 --gamma 1.0:1.0:.6
xrandr --output LVDS1 --brightness 1.0 --gamma 1.0:1.0:.6
xgamma -screen LVDS1 -rgamma 1.0 -ggamma 1.0 -bgamma 0.6
xgamma -screen VGA1  -rgamma 1.0 -ggamma 1.0 -bgamma 0.6

# Decrease LVDS's brigthness to a little less than VGA so that they look the same
xbacklight -set 40

# xrandr --output LVDS1 --set BACKLIGHT_CONTROL {combination, native, legacy,kernel}
# xrandr --output LVDS1 --set BACKLIGHT 1001
# xrandr --output VGA1  --set BACKLIGHT_CONTROL {combination, native, legacy,kernel}
# xrandr --output VGA1  --set BACKLIGHT 1001
