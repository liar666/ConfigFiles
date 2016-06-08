#!/bin/bash
if [[ $# != 1 ]]; then
    echo "USAGE: $0 <dir>"
else
    \ls -C1 $1/lib/*.jar | sed -rn 's/([a-z0-9-]+)-.*/\1/p' | uniq -d
fi
