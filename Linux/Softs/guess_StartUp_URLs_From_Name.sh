sed -rn 's/[0-9]+, "([^"]*)",.*/\1/p' output.csv | \
while read name;
do
    ## NOTE: on peut ajouter la première ligne du comment ou "startup" pour préciser
    url=$(. ~/Softs/google_lucky_first_result "$name" 2>&1 | grep -F 'Location:' | sed -n '2p' | cut -d ' ' -f 2- | cut -d '[' -f 1)
    echo "${name}, ${url}"
    sleep 2
done
