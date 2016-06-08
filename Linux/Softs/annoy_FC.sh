. Softs/set_volume 170
sounds=$(\ls ~/.sounds/win10/[a-z]*.wav)
for i in {1..4}
do
    rdm=$((1800+RANDOM%3600))
    echo "Sleeping $rdm seconds"
    sleep $rdm
    toplay=$(echo "$sounds" | sort -R | head -n 1)
    mplayer "$toplay"
done

# halt is started as root/sound played as user!
# USAGE: sleep $((3600*<#hrs to start>)) ; . ~/Softs/annoy_FC.sh ; halt -p
