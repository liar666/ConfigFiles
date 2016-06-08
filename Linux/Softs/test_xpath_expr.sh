if [[ $# != 2 ]]
then 
    echo "Usage: $0 <file.[html|xml]> <XPath Expression>"
else
    ext=${1##*.}
    case $ext in
	html) OPTS="--html" ;;
	xml) OPTS="" ;;
    esac
    xmllint $OPTS --nowarning --xpath '$2' $1
fi
