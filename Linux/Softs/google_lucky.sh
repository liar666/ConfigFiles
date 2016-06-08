#### returns content of the page that is the first result of google
. ~/Softs/fakeuseragent.sh

if [[ $# != 1 ]] ; then
    echo "USAGE: $0 <google query string>"
else
    mysearch=$1
    wget --no-check-certificate -U "${UAGENT}" 'http://www.google.com/search?q='"${mysearch}"'&gfns=1&sourceid=navclient' -O -
fi
