if [[ $# != 1 ]]
then
    echo "Usage: $0 <comma separated list to be sorted>"
else
    . ~/Softs/list_treat.sh "sort" $1
fi