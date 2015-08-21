export CLASSPATH=$CLASSPATH:/home/fcoulon/dev/sofia2/lib/presans-commons-1.0.jar:/home/fcoulon/dev/sofia2/lib/presans-jsofia-1.0.jar
for i in /home/fcoulon/dev/presans-lib/jars/*.jar ; do export CLASSPATH=$CLASSPATH:$i ; done
cd ../fcoulon/dev/dist/
## For a complete directory with queuing.xxxx files
#java fr.presans.jsofia.importing.ImportScheduler <directory>
## For a single foaf file
#java fr.presans.jsofia.importing.FileParser --cfe=<cfe id> ~/<file>.foaf
cd -
