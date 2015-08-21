#!/bin/bash

string=$1
shift=$2

length=${#string}
echo ${string:$length-$shift:$shift}${string:0:$length-$shift}
