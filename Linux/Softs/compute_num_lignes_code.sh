compute_nb_lines () {
    echo "$1"
    presa=$(eval find presans-*/ -name "$1")
    sofia=$(eval find sofia*/ -name "$1")
    all="$presa $sofia"
    # echo $all  
    out=`echo $all | xargs wc -l | awk '{ print $1 }' | tr '\n' '+'`
    echo "${out%?}" | bc
}

compute_nb_lines "'*.java'"
compute_nb_lines "'*.groovy'"
compute_nb_lines "'*.gsp'"

