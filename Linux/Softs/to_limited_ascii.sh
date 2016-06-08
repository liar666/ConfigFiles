echo "$1" | tr '[A-Z]' '[a-z]' | sed 's/[^\x20-\x7E]//g'
