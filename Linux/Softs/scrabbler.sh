#! /bin/bash
if [ $# -le 0 ] ; then
    echo "USAGE: $0 <start of word> <letters you have>"
else
    wordStart=$1
    letters=$*
    letters=`echo $letters | cut -d' ' -f 2-`
    endCmdString="grep ${wordStart} /usr/share/dict/words"
    for i in $letters; do endCmdString=${endCmdString}" | grep $i" ; done
    eval $endCmdString
fi