# Radomly choose chars to uppercase
random_case () {
    typeset -a lower=({a..z}) # array of lowercase letters
    typeset -a upper=({A..Z}) # array of uppercase letters

    r1=$(($RANDOM%25))
    r2=$(($RANDOM%25))
    s=$(( ($r1>$r2)?$r2:$r1 )) # min(r1,r2)
    e=$(( ($r1>$r2)?$r1:$r2 )) # max(r1,r2)
    echo $1 | tr [${lower[$s]}-${lower[$e]}] [${upper[$s]}-${upper[$e]}]
}

# Concat current string plus special chars or numbers plus the new word
concat () {
    curr_string=$1
    new_word=$2

    SPECIAL_CHARS=( \' '"' '`' '#' '{' '[' '(' ')' ']' '}' '~' '-' '^' '@' '&' '$' ':' '.' ',' ';' '%' '<' '=' '>' '?' \! '*' '+' '/' '|' '\' )
    NB_CHARS=${#SPECIAL_CHARS[*]}

    if [[ $((${RANDOM}%2)) != 0 ]] ; then
        aleat=${RANDOM}%${NB_CHARS}
        echo ${curr_string}${SPECIAL_CHARS[$aleat]}${new_word}
    else
        aleat=$((${RANDOM}%999))
        echo ${curr_string}${aleat}${new_word}
    fi
}

word1=$(random_case `. ~/Softs/random_word.sh | tr -d "'"`)
word2=$(random_case `. ~/Softs/random_word.sh | tr -d "'"`)
word3=$(random_case `. ~/Softs/random_word.sh | tr -d "'"`)

echo `concat $word1 $(concat "$word2" "$(concat $word3 "")")`
