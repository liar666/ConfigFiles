#!/bin/bash
if [[ $# != 2  ]]
then 
    echo "USAGE: $0 <filename> <sheetname>"
else
    file="$(readlink -f "$1")"
    sheet="$2"
    soffice -invisible -headless -norestore "macro:///Standard.Module1.ConvertXls2Csv(\"${file}\", \"${sheet}\")"
fi