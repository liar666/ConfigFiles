#!/bin/bash

## Will put all downloaded files in /tmp
TEMP_DIR=/tmp/

# GM's SMS contacts
USR=10082505
KEY=R7CFtXfnfvWwLn
URL='https://smsapi.free-mobile.fr/sendmsg?user='"${USR}"'&pass='"${KEY}"


## Not sure if HTTP reget works on twitrss.me
#out=$(wget --timestamping "https://twitrss.me/twitter_user_to_rss/?user=rerb")
out=$(wget -P ${TEMP_DIR} --timestamping "https://twitter.com/RERB" 2>&1)
matches=$(echo "${out}" | grep -F '304 Not Modified')

##diffs=$(diff ${TEMP_DIR}/RERB{,.old} | grep -F '<p class="TweetTextSize ') ##  grep -vE '(token|nonce|input type="hidden"|---|[0-9]+c[0-9]+)'


if [[ x"${matches}" == x"" ]]
then
    ## second level of protection, in case HTTP regets useless page (this IS the case since Twitter actualizes the page to match the time when messages were sent :{)
    mv -f ${TEMP_DIR}/RERB.small{,.old}
    lynx --force-html --dump ${TEMP_DIR}/RERB | grep "RER B " -A 2 | head -n 50 | sed -rn '/[0-9]+\./,+3p' | sed -r '/[0-9]+\./d' | sed -r '/Bjr /,+2d' | head -n 10 | tr '\n' ' ' | sed -r 's/\[[^]]+\]//g' | sed 's/--/%0D/g' | sed -r 's/ +/ /g' > ${TEMP_DIR}/RERB.small
    diffs=$(diff ${TEMP_DIR}/RERB.small{,.old})
    if [[ x"${diffs}" != x"" ]]
    then
        ## Also get global info page
        # wget --timestamping "http://www.ratp.fr/informer/trafic/trafic.php?cat=2"
        # lynx --dump 'trafic.php?cat=2' | sed -n '/^Réseau RER - Bulletin trafic en temps réel/,/^Travaux/p' | head -n  -6 | tail -n +3
        m=$(cat ${TEMP_DIR}/RERB.small)
        wget -O - "${URL}"'&msg='"${m}" >& /dev/null
    fi
fi
