# Must be set before awesome starts otherwise it will not take them into account
. ~/Softs/set_keyboard &
. ~/Softs/set_screens.sh &

# Defines c-tab correctly for console
xrdb -override ~/.Xresources

exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
