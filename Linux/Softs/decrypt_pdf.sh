if [[ $# != 1 ]]
then 
    echo "USAGE: $0 <pdf file to decrypt>"
else
    ps2ps -sDEVICE=pdfwrite "$1" "`basename \"$1\" .pdf`_dec.pdf"
fi