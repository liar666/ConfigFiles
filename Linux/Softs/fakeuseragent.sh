function gen_fake_uagent {
    [[ $((RANDOM%2)) -eq 0 ]] && TYPE="Mozilla" || TYPE="Firefox"
    case $((RANDOM%3)) in
	0) OSTYPE="Windows NT $((RANDOM%2+5)).$((RANDOM%6))";;
	1) OSTYPE="Macintosh" ;;
	2) OSTYPE="compatible";;
    esac
    echo "${TYPE}/$((RANDOM%4+1)).$((RANDOM%10)) ($OSTYPE)"
}

UAGENT=$(gen_fake_uagent)
