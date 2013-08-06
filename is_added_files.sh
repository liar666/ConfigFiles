# TO BE RUN IN ~/
for i in Softs/* ; do echo $i ;  diff "$i" "Work/PreSans/Config/ConfigFiles/Linux/$i" ; done
for i in `find  -maxdepth 1 ~/Work/PreSans/Config/ConfigFiles/Linux/ -name '.*'` ; do echo "***** $i" ; diff $i `basename $i` ; done
