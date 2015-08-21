. ~/Softs/runonlyonce

# Must be set before awesome starts otherwise it will not take them into account
. ~/Softs/set_language &
. ~/Softs/set_keyboard &

## Must be started after X/awesome is started
# gpointing-device-settings &
. ~/Softs/enable_Emulate3Buttons.sh &
. ~/Softs/disable_scroll+tap.sh &
. ~/Softs/set_mouse &

. ~/Softs/set_background &
. ~/Softs/set_volume &

. ~/Softs/start_screensaver &
. ~/Softs/start_network &
. ~/Softs/start_dropbox &
#. ~/Softs/start_u1 &
(sleep 2 ; . ~/Softs/start_updatemanager) &

### . ~/Softs/start_im &
. ~/Softs/start_ssh_gpg_agents &

### Set PreSans proxy to circumvent WatchGuard@Remix
. ./Softs/set_proxy_KimSufi
