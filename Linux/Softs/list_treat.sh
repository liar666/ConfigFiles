if [[ $# != 2 ]]
then
    echo "Usage: $0 <treatment> <comma separated list to be treated>"
else
    echo $2 | tr ',' '\n' | $1 | uniq | tr '\n' ','
fi