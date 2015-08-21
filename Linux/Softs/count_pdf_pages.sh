#!/bin/sh
if [ $# != 1 ]
then
    echo "USAGE: $0 <pdf file>"
else
    pdfinfo $1 | grep 'Pages:' | awk '{print $2}'
fi