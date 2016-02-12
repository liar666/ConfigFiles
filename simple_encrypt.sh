## TODO1: randomize second part of dual*?
## TODO2: add puntuation marks

#alphabet=$(echo {a..z} {A..Z} | tr -d " ")
accent=$(for i in {192..255} ; do awk "BEGIN{ printf \"%c\", $i }" ; done)
accentLength=${#accent}
dualAcc=${accent}${accent}
noaccent=$(for i in {48..57} {65..90} {97..122} ; do awk "BEGIN{ printf \"%c\", $i }" ; done)
noaccentLength=${#noaccent}
dualNoAcc=${noaccent}${noaccent}

encrypt(){
    filename=$1
    fromAcc=$2
    toAcc=$3
    fromNoAcc=$4
    toNoAcc=$5
    cat "${filename}" | tr "${fromAcc}" "${toAcc}" | tr "${fromNoAcc}" "${toNoAcc}"
}

if [[ $# != 3 ]] ; then
    echo "USAGE: $0 -enc/-dec <file to \"encrypt\"> <shift>"
else
    action=$1
    filename=$2
    shift=$3

    fromAcc=${dualAcc:0:${accentLength}}
    toAcc=${dualAcc:${shift}:${accentLength}}
    fromNoAcc=${dualNoAcc:0:${noaccentLength}}
    toNoAcc=${dualNoAcc:${shift}:${noaccentLength}}
    if [[ ${action} == "-enc" ]] ; then
        encrypt ${filename} "${fromAcc}" "${toAcc}" "${fromNoAcc}" "${toNoAcc}"
    else
        encrypt ${filename} "${toNoAcc}" "${fromNoAcc}" "${toAcc}" "${fromAcc}"
    fi
fi
