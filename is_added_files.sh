# TO BE RUN IN ~/
for i in Softs/*
do
  echo $i
  diff "$i" "Work/PreSans/ConfigFiles/Linux/$i"
done

for i in `find ~/Work/PreSans/ConfigFiles/Linux/ -maxdepth 1 -name '.*'`
do
  echo "***** $i"
  diff $i `basename $i`
done
