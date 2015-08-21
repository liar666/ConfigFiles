# http://blogs.operationaldynamics.com/andrew/software/java-gnome/eclipse-code-format-from-command-line
# http://liviutudor.com/2012/03/02/batch-source-formatting-in-eclipse-indigo/

if [[ $# != 1 ]]
then
    echo "USAGE: $0 <java file to format>"
else
    eclipse \
	-vm `which java` \
	-application org.eclipse.jdt.core.JavaCodeFormatter \
	-verbose \
	-config /home/guillaume/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/org.eclipse.jdt.core.prefs \
	$*
fi
