#!/bin/sh
if [[ $# != 3 ]]
then
  echo "USAGE: $0 <pdffile> <start page> <end page>"
else
  pdftotext -q -f $2 -l $3 $1 -
  
  # alternative methods:

  # pdfnup -q --nup 1x1 $1 "$2-$3" -o /dev/stdout | ps2ascii

   # output=`java -jar Softs/Tika/tika-app-1.3.jar --xml $1`
   # lineNbs=`echo "$output" | nl | grep -e '<div cla' | awk "NR==$2||NR==$(($3+1)) { print }"| awk '{ print $1 }'`
   # lineNba=`echo "$lineNbs" | head -n 1`
   # lineNbb=$((`echo "$lineNbs" | tail -n 1`-1))
   # #echo "Getting text from line $lineNba to $lineNbb"
   # echo "$output" | awk "NR>=$lineNba&&NR<=$lineNbb { print }"

   # java -jar Softs/PDFBox/pdfbox-app-1.8.2.jar ExtractText -startPage $2 -endPage $3 -console $1

fi
