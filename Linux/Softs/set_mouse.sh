# Prevents gnome dialogs to take the mouse focus
gsettings set org.gnome.desktop.wm.preferences focus-mode 'mouse'
##gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'

# Clicking Butt1+2 => paste [DOES NOT WORK]
synclient "EmulateMidButtonTime=40"

# Tapping 2 fingers => paste!!!
synclient "TapButton1=1"
synclient "TapButton2=2"
synclient "TapButton3=3"
