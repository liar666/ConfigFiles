#!/bin/bash
set -o nounset # Prevents referencing undefined variables, instead of returng ""
# equiv: -u
set -o errexit # Prevents ignoring failing commands
# equiv: -e

# Tips:
# USE "$@" more often than $*!
# USE [[]] instead of []
# USE $() rather than ``

# Builtin vars:
# $0   name of the script
# $n   positional parameters to script/function
# $$   PID of the script
# $!   PID of the last command executed (and run in the background)
# $?   exit status of the last command  (${PIPESTATUS} for pipelined commands)
# $#   number of parameters to script/function
# $@   all parameters to script/function (sees arguments as separate word)
# $*   all parameters to script/function (sees arguments as single word)

# Substitution:
# f="path1/path2/file.ext"
# single_subst="${f/path?/x}"   # = "x/path2/file.ext"
# global_subst="${f//path?/x}"  # = "x/x/file.ext"
# # string splitting
# readonly DIR_SEP="/"
# array=(${f//${DIR_SEP}/ })
# second_dir="${arrray[1]}"     # = path2

# Deletion:
# f="path1/path2/file.ext"
# # deletion at string beginning
# extension="${f#*.}"  # = "ext"
# # greedy deletion at string beginning
# filename="${f##*/}"  # = "file.ext"
# # deletion at string end
# dirname="${f%/*}"    # = "path1/path2"
# # greedy deletion at end
# root="${f%%/*}"      # = "path1"


# Debugging:
# bash -n myscript.sh   # perform a syntax check/dry run
# bash -v myscripts.sh  # produce a trace of every command executed
# bash -x myscript.sh   # produce a trace of the expanded command
