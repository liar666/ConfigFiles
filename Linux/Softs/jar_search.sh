#!/bin/bash
cd lib 
for f in *.jar
do
	if jar tf $f | grep $1
	then
		echo $f
	fi
done
