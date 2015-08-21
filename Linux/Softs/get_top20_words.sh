#!/bin/sh
if [[ $# != 1 ]]
then
    echo "USAGE: $0 <pdf file>"
else
    . ~/Softs/extract_PDF_FirstPages.sh $1 1 2 | tr ' ' '\n' | tr -d ',' | tr -d '(' | tr -d ')' | perl -e 'while (<>) { print if length($_)>5; }' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn  | head -n 20
fi