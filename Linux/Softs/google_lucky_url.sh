#!/bin/bash
#### returns the URL that is the first result of google
. ~/Softs/fakeuseragent.sh

if [[ $# != 1 ]] ; then
    echo "USAGE: $0 <google query string>"
else
    mysearch=$1
    wget --no-check-certificate -U "${UAGENT}" 'https://encrypted.google.com/search?hl=en&q='"${mysearch}" -O - 2> /dev/null | xmllint --html - 2>&1 | tee /tmp/out.html | grep -F '<h3 class="r">' | head -n1 | sed -rn 's/.*(https?:\/\/[a-zA-Z0-9.+-]+\/).*/\1/p'
fi
