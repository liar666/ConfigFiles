for i in {1..100}
do
    rdm=$((RANDOM%3))
    case $rdm in
	0) mplayer /usr/share/skype/sounds/ChatIncoming.wav ;;
	1) mplayer /usr/share/skype/sounds/ChatOutgoing.wav ;;
	2) mplayer /usr/share/skype/sounds/ChatIncomingInitial.wav ;;
    esac

    rdm=$((RANDOM%10))
    echo "Sleeping $rdm seconds"
    sleep $rdm
done