pkgs=""
for i in *[0-9]*.jar
do
    name=$(echo $i | rev | cut -d '-' -f 2- | rev)
    pkgs=$pkgs"\n$name"
done

#echo -e "$pkgs" | uniq -d

for d in `echo -e "$pkgs" | uniq -d`
do
    dups=$(/bin/ls -C1 ${d}-*.jar)
    echo "$dups"
    #echo "$dups" | head -n -1 | xargs /bin/rm -f 
    #version=$(echo $d | rev | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
done