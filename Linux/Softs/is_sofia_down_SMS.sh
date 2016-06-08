#!/usr/bin/bash

USR=10082505
KEY=R7CFtXfnfvWwLn
URL='https://smsapi.free-mobile.fr/sendmsg?user='"${USR}"'&pass='"${KEY}"
TIMEOUT=5
TRIES=2

XSEARCHOUT=~/tmp/xsearch.out
wget --tries=${TRIES} --timeout=${TIMEOUT} 'http://presans.com:888/sofia/search/advanced#C:G-E0' -O - > ${XSEARCHOUT} 2> ${XSEARCHOUT}.2
xsearch=$(cat ${XSEARCHOUT} | grep -F 'href="http://presans.com/about-presans/contact-or-visit-us/">Contact us</a>')
if [[ x"$xsearch" == x"" ]]; then
    mesg='XSEARCH IS DOWN OR ULTRA SLOW!!!'
    echo "${mesg}"
    m=$(echo "${mesg}" | sed 's/ /%20/g')
    wget -O - "${URL}"'&msg='"${m}" >& /dev/null
else
    echo 'XSEARCH IS OK!!'
fi

SOFIAOUT=~/tmp/sofia.out
wget --tries=${TRIES} --timeout=${TIMEOUT} 'http://presans.com:888/sofia/x-call/guest?cfe=0' -O - > ${SOFIAOUT} 2> ${SOFIAOUT}.2
sofia=$(cat ${SOFIAOUT} | grep -F '<title>Presans - Connecting Business &amp; Expertise</title>')
if [[ x"$sofia" == x"" ]]; then
    mesg='SOFIA IS DOWN OR ULTRA SLOW'
    echo "${mesg}"
    m=$(echo "${mesg}" | sed 's/ /%20/g')
    wget -O - "${URL}"'&msg='"${m}" >& /dev/null
else
    echo 'SOFIA IS OK!!'
fi

