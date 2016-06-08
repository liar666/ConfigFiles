. ~/Softs/google_lucky.sh "$1" > /tmp/mail_guess
sed -rn 's/.*(mailto)?[":]([a-zA-Z0-9.-]+(@|_?[aA][tT]_?|_?[cC][hH][eE][zZ]_?)[a-zA-Z.-]+).*/\2/p' /tmp/mail_guess
