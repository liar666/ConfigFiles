NB_WORDS=$(cat /usr/share/dict/words | wc -l)
sed -n "`shuf -i 1-${NB_WORDS} -n 1` p" /usr/share/dict/words