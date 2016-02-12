#unset TERM
#export TERM=xterm-xfree86   # xterm-color, wsvt25
export TERM=xterm-256color # wsvt26

if [[ $0 == "-bash" ]]
then
    setterm -blength 0
fi

ulimit -c 0 -d 2097152 -m 2097152 # -u 20000 does not work in k3.16 bsh4.3.30# -v 2097152
umask u=rwx,g=,o=  ##umask 0077

if [[ $(cat /proc/$PPID/status | head -1 | cut -f2) != "sshd" ]]
then
    mesg n
    xhost local:root + > /dev/null
    calendar -A 3 -B 1 -f .dates_naissances
fi

export IGNOREEOF=0              # directly exists when CTL-d is hit
export HISTFILE=~/.bash_history # file name to save commands history
export HISTFILESIZE=150         # size of in-file list of last commands
export HISTSIZE=300             # size of in-memory list of last commands
export HISTCONTROL=ignoredups   # do not save multiple executions of same command in history
shopt -s cmdhist                # saves multiple lines command
shopt -s autocd                 # if a directory is given with no command => cd to this dir
##shopt -s cdspell                # corrects typos in dir names during cd
shopt -s dirspell               # corrects typos in dir names during completion
shopt -s histappend             # appends in-memory commands history to in-file history, thus allowing merging histories from multiple XTerms
#shopt -s histreedit   # allows reedition of failed substitution
#shopt -s histverify   # allows to test substitution before sending command
#shopt -s hostcomplete # allows completion of hostname (after "@")
#shopt -s huponexit    # kills child processes
#shopt -s lithist      # Keeps newline chars into save commands instead of replacing by ;
#shopt -s no_empty_cmd_completion # do not complete empty lines!
#shopt -s nocaseglob   # do not consider case in completion
PROMPT_COMMAND="history -a ${PROMPT_COMMAND}" # save each command right after it has been executed ; ; history -c ; history -r;

export NO_AT_BRIDGE=1 # to remove atk/gtk warnings about DBus "Couldn't register with accessibility bus: Did not receive a reply"

export SVN_SSH="ssh -p 22"
export SVN_EDITOR="emacs"
export GIT_EDITOR="emacs"

export PRINTER=

export PATH=$PATH:/usr/X11R6/bin/:/sbin:/usr/local/bin:/home/guillaume/Softs/:/home/guillaume/Softs/eclipse:/home/guillaume/Softs/SublimeText3:/usr/share/go/src/pkg/github.com/t3rm1n4l/megacmd/

whereisjavac=`ls -l /etc/alternatives/javac | awk '{ print $11 }'`
export JDK_HOME=$(dirname $(dirname $whereisjavac))
export JAVA_HOME=${JDK_HOME}
export WEKA_HOME=~/.wekafiles/
export GRAILS_HOME=/usr/local/grails-2.3.0/
export PATH=/usr/local/grails-2.3.0/bin/:$PATH
export GRAILS_OPTS="-Ddisable.auto.recompile=true -Xmx1536M -server -Dhttp.proxyHost=cache.polytechnique.fr -Dhttp.proxyPort=8080 -Dhttp.nonProxyHosts='localhost,127.0.0.1'" #-XX:MaxPermSize=128M removed in J8
export JAVA_OPTS="-Xmx1G -server" # -XX:MaxPermSize=64M removed in J8
# -XX:+UseSerialGC
# -XX:+CMSClassUnloadingEnabled (replaces -XX:+CMSPermGenSweepingEnabled)
# -XX:+UseParallelGC or -XX:+UseSerialGC
# -XX:+UseConcMarkSweepGC or -XX:+UseParNewGC
# -XX:+PrintGCDetails
# -XX:+UseAdaptiveSizePolicy #  used by default with the -XX:+UseParallelGC




export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.6/:.

# GM : CLASSPATH for coding at Presans
#. ~/Softs/classpaths

# NOTE: the // indicates to LaTeX to get recursively into the subdirs.
#for i in  .  ~/.TeX/installedPkgs/*
#do
#  export TEXINPUTS=${i}//:$TEXINPUTS
#  export BIBINPUTS=${i}//:$BIBINPUTS
#  export BSTINPUTS=${i}//:$BSTINPUTS
#done

alias ls='ls -hl --color'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias mplayer='mplayer -softvol-max 1000 -softvol -vo xv -heartbeat-cmd "xscreensaver-command -deactivate" -stop-xscreensaver -ao alsa -zoom'
alias startx='~/.mystartx'
alias xemacs='emacs'
alias emacs='DBUS_SESSION_BUS_ADDRESS= emacs'
alias vi='vim'
alias rm='/bin/myrm'
alias clear='clear -T vt220'
alias qemu='qemu-system-x86_64 -m 1024 -soundhw sb16 -net nic,model=rtl8139 -net user'
alias grepp='grep -A6 -B6 -i -a'
alias cat8='iconv -t utf-8 -f iso-8859-1'
alias unlink='cd `pwd -P`'
alias nolimit='ulimit -d $((3*`ulimit -d`))'
alias bc='bc -l'
alias xpdf='xpdf -z page'
alias java='java $JAVA_OPTS'
#alias grails='grails $GRAILS_OPTS'
alias nautilus='nautilus --no-desktop'
alias bc='bc -l'
alias R='R --no-save --no-restore-data --quiet --no-save'
alias pdf2imgportrait='convert -quality 98 -resize 1240x1753 -extent 1240x1753 -gravity center -units PixelsPerInch -density 150x150 -background white '
alias pdf2imglandscape='convert -quality 98 -resize 1753x1240 -extent 1753x1240 -gravity center -units PixelsPerInch -density 150x150 -background white '
alias img2pdfportrait='convert -quality 98 -resize 1240x1753 -extent 1240x1753 -gravity center -units PixelsPerInch -density 150x150 -background white '
alias img2pdflandscape='convert -quality 98 -resize 1753x1240 -extent 1753x1240 -gravity center -units PixelsPerInch -density 150x150 -background white '
alias xterm='xterm -bg LightLightGrey -fg black'

##-ANSI-COLOR-CODES-##
ColorOff="\001\033[0m\002"
###-Regular-###
Red="\001\033[0;31m\002"
Green="\001\033[0;32m\002"
Blue="\001\033[0;34m\002"
Purple="\001\033[0;35\002"
####-Bold-####
BRed="\001\033[1;31m\002"
BGreen="\001\033[1;32m\002"
BBlue="\001\033[1;34m\002"
BPurple="\001\033[1;35m\002"
BGreyU8="\[\e[1m\e[38;5;245m\]"
BDarkBlueU8="\[\e[1m\e[38;5;21m\]"
BMagentaU8="\[\e[1m\e[38;5;126m\]"
BDarkYellowU8="\[\e[1m\e[38;5;220m\]"
BGreenU8="\[\e[1m\e[38;5;40m\]"
BLightBlueU8="\[\e[1m\e[38;5;51m\]"
####-Italics-####
IGreyU8="\[\e[1m\e[18;3;245m\]"
IDarkBlueU8="\[\e[1m\e[18;3;21m\]"
IMagentaU8="\[\e[1m\e[18;3;126m\]"
IDarkYellowU8="\[\e[1m\e[18;3;220m\]"
IGreenU8="\[\e[1m\e[18;3;40m\]"
ILightBlueU8="\[\e[1m\e[18;3;51m\]"

# Status of last command (for prompt)
function __stat() {
    if [[ $? -eq 0 ]]
    then
        echo -en "${Green}[\u2714]${ColorOff}"
    else
        echo -en "${Red}[\u2718]${ColorOff}"
    fi
}

PS1=""
if [[ "$TERM" != "xterm" && "$TERM" != "xterm-color" && "$TERM" != "xterm-256color" && "$TERM" != "linux" && "$TERM" != "vt220" && "$TERM" != "wsvt25" && "$TERM" != "xterm-xfree86" ]]
then
  PS1+="\u@\h:\W$ "
else
  PS1+='$(__stat) '"${BDarkBlueU8}\u${ColorOff}@\h:\W$ "
fi
export PS1

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
