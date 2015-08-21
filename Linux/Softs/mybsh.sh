JLINE=/usr/share/java/jline.jar
BSH=/usr/share/java/bsh.jar

if [[ $# < 0 ]]
then
    echo "USAGE: $0 [<path/to/jars>]"
else
    CLASSPATH=${JLINE}:${BSH};
    for path in $*
    do
	for jar in ${path}/*.jar
	do
	    CLASSPATH=${CLASSPATH}:${jar}
	done
    done
    # export CLASSPATH
    java -classpath ${CLASSPATH} jline.ConsoleRunner bsh.Interpreter
fi