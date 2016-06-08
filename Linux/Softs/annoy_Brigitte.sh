sounds=$(\ls ~/.sounds/win10/[a-z]*.wav)
for i in {1..100}
do
    toplay=$(echo "$sounds" | sort -R | head -n 1)
    mplayer "$toplay"

    rdm=$((RANDOM%5))
    echo "Sleeping $rdm seconds"
    sleep $rdm
done
