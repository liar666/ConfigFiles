# A function that runs a process only if it is not already running 
function run_only_once()
{
    IFS=" " read -a splitted <<< $1
    progName=`basename ${splitted[0]}`
    if [[ "$progName" == "sudo" ]]
    then
	progName="`basename ${splitted[1]}`"
    fi
    mesg=$(pgrep "$progName" || eval ${splitted[*]} 2>&1)
    ##echo "$mesg" >> /home/guillaume/mesg_${progName}
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
