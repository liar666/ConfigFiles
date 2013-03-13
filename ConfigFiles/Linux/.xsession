# A function that runs a process only if it is not already running 
function run_only_once()
{
    IFS=" " read -a splitted <<< $1
    pgrep -u `id -u` -x `basename ${splitted[0]}` || eval ${splitted[*]} # use -f => ?
}

# gpointing-device-settings &
. ~/Softs/enable_Emulate3Buttons.sh &
. ~/Softs/set_keyboard &
. ~/Softs/set_proxy &
. ~/Softs/set_background &
. ~/Softs/set_volume &

. ~/Softs/start_screensaver &
. ~/Softs/start_network &
. ~/Softs/start_dropbox &
. ~/Softs/start_u1 &
. ~/Softs/start_updatemanager &

. ~/Softs/start_im &