if `tty -s`
then
        mesg n
#        xhost local:root + > /dev/null
fi

umask 0077

export IGNOREEOF=0              # directly exists when CTL-d is hit
export HISTFILE=~/.bash_history # file name to save commands history
export HISTFILESIZE=50          # size of in-file list of last commands
export HISTSIZE=100             # size of in-memory list of last commands
export HISTCONTROL=ignoredups   # do not save multiple executions of same command in history
shopt -s cmdhist                # saves multiple lines command
shopt -s autocd                 # if a directory is given with no command => cd to this dir
#shopt -s cdspell                # corrects typos in dir names during cd
shopt -s dirspell               # corrects typos in dir names during completion
shopt -s histappend             # appends in-memory commands history to in-file history, thus allowing merging histories from multiple XTerms
#shopt -s histreedit   # allows reedition of failed substitution
#shopt -s histverify   # allows to test substitution before sending command
#shopt -s hostcomplete # allows completion of hostname (after "@")
#shopt -s huponexit    # kills child processes
#shopt -s lithist      # Keeps newline chars into save commands instead of replacing by ;
#shopt -s no_empty_cmd_completion # do not complete empty lines!
#shopt -s nocaseglob   # do not consider case in completion
export PROMPT_COMMAND="history -a"

# if [[ "$STY"x != ""x ]]
# then
#     export TERM=screen-256color
# else
    export TERM=xterm-256color
# fi

colors=$(tput colors)
if (($colors >= 256)); # Terminal supports 256 colours
then
# ESC[ … 38;2;<r>;<g>;<b> … m Select RGB foreground color
    color_root='\[\e[1m\e[38;5;196m\]'
    color_user='\[\e[1m\e[38;5;220m\]' # 245 = grey / 21 = blue / 126 = magenta / 220 = yellow / 40 = green
    color_undo='\[\e[0m\]'
elif (($colors >= 8)); then # Terminal supports only eight colours
    color_root='\[\e[1;31m\]'
    color_user='\[\e[1;32m\]'
    color_undo='\[\e[0m\]'
else # Terminal may not support colour at all
    color_root=
    color_user=
    color_undo=
fi

if ((EUID == 0)); then
    PS1="[`date '+%D-%T'`] ${color_root}\u${color_undo}@\h:\w# "
else
    PS1="[`date '+%D-%T'`] ${color_user}\u${color_undo}@\h:\w$ "
fi

export EDITOR="mg"


export SVN_SSH="ssh -p 22"
export SVN_EDITOR="emacs -nw"
export GIT_EDITOR="emacs -nw"

export PRINTER=

export PATH=$PATH:/usr/X11R6/bin/:/sbin:/usr/local/bin:/home/gmuller/Softs/
whereisjavac=$(readlink /etc/alternatives/javac)
#export R_HOME=$(dirname $(which R))
export R_HOME=/usr/local/lib/R
export JDK_HOME=$(dirname $(dirname $whereisjavac))
export JAVA_HOME_SOFIA=${JDK_HOME}
export JAVA_HOME_R=${JDK_HOME}
export JAVA_HOME=${JAVA_HOME_SOFIA}
export GRAILS_HOME=/usr/local/grails-2.3.0/
##export GRAILS_HOME=/usr/local/grails-2.3.7/
##export GRAILS_HOME=/usr/local/grails-2.4.4/
export PATH=${PATH}:${GRAILS_HOME}/bin:${JAVA_HOME}/jre/bin
###export GRAILS_OPTS="-Xms1G -Xmx2G -server -Djava.net.preferIPv4Stack=true -XX:+CMSClassUnloadingEnabled" #  --stacktrace ## support removed in OpenJDK8 -XX:MaxPermSize=256M
##export JAVA_OPTS="-Xms1G -Xmx2G -server -XX:MaxPermSize=256M -XX:+CMSClassUnloadingEnabled -Dhttp.proxyHost=cache.polytechnique.fr -Dhttp.proxyPort=8080 -Dhttp.nonProxyHosts='localhost,127.0.0.1'"
###export JAVA_OPTS="-server -XX:+UseParallelGC -Xloggc:/home/gmuller/java_log.text -XX:+PrintGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xms1G -Xmx2G -Djava.net.preferIPv4Stack=true" ## support removed in OpenJDK8 -XX:MaxPermSize=256M
#. ~/Softs/set_OpenJDK
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# -XX:+UseSerialGC
# -XX:+CMSClassUnloadingEnabled (replaces -XX:+CMSPermGenSweepingEnabled)
# -XX:+UseParallelGC or -XX:+UseSerialGC
# -XX:+UseConcMarkSweepGC or -XX:+UseParNewGC
# -Xloggc:~/java_log.text -XX:+PrintGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps
# -XX:+UseAdaptiveSizePolicy #  used by default with the -XX:+UseParallelGC

alias ls='/bin/ls -ahl --color'
alias mv='/bin/mv -i'
#alias rm='/bin/rm -I'
alias rm='/bin/myrm'
alias cp='cp -i'
alias bc='bc -l'
alias xemacs='emacs'
alias emacs='emacs'
alias clear='clear -T vt220'
alias grepp='grep -A6 -B6 -i'
alias cat8='iconv -t utf-8 -f iso-8859-1'
alias unlink='cd `pwd -P`'
alias nolimit='ulimit -d $((3*`ulimit -d`))'
###alias java='export JAVA_HOME=${JAVA_HOME_SOFIA} ; java $JAVA_OPTS'
###alias grails='export JAVA_HOME=${JAVA_HOME_SOFIA} ; grails $GRAILS_OPTS'
alias R='export JAVA_HOME=${JAVA_HOME_R} ; R --no-save --no-restore-data --quiet --no-save'
alias Rscript='export JAVA_HOME=${JAVA_HOME_R} ; Rscript'
alias xterm='xterm -fg White -bg Black'
alias wine32='wine'
alias pdf2imgportrait='convert -quality 98 -resize 1240x1753 -extent 1240x1753 -gravity center -units PixelsPerInch -density 200x200 '
alias pdf2imglandscape='convert -quality 98 -resize 1753x1240 -extent 1753x1240 -gravity center -units PixelsPerInch -density 200x200 '
alias img2pdfportrait='convert -quality 98 -resize 1240x1753 -extent 1240x1753 -gravity center -units PixelsPerInch -density 200x200 '
alias img2pdflandscape='convert -quality 98 -resize 1753x1240 -extent 1753x1240 -gravity center -units PixelsPerInch -density 200x200 '
alias qupzilla='LC_MONETARY=en_US.ISO8859-1 LC_NUMERIC=en_US.ISO8859-1 LC_ALL=en_US.ISO8859-1 LC_MESSAGES=en_US.ISO8859-1 LC_COLLATE=en_US.ISO8859-1 LC_CTYPE=en_US.ISO8859-1 LC_TIME=en_US.ISO8859-1 qupzilla'
alias qemu='qemu-system-x86_64 -m 2048 --enable-kvm -cpu core2duo -machine q35 -smp 4 -usb -device usb-kbd -device usb-mouse -no-acpi -soundhw all -vga std -no-kvm-irqchip -net nic,model=rtl8139 -net nic,model=e1000 -net nic,model=ne2k_pci -net user -boot c'
alias calibre='ebook-viewer'
# mostly for Xemacs+utf8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="C"
export LC_TIME="C"
export LC_NUMERIC="C"
export LC_MONETARY="C"
export LC_MESSAGES="en_US.UTF-8"
export LC_ALL=""

# Max file size per process: 8GB
#ulimit -f 8388608
#ulimit -f 16777216  # 16Gb

calendar -f ~/.dates_naissances2 -A 3 -B 3

# To enable "locating" files within my crypted /home!
export LOCATE_PATH="$HOME/.mlocate.db"
