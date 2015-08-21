if [[ $# != 1 ]]
then
    echo "USAGE: $0 <xml file>"
else
    cat $1 | sed -e "s/><TOKEN/\n/g" | sed -e 's/[^>]*>\([^<]*\)<.*/\1/g' | tr '\n' ' '
fi