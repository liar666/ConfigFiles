export TERM=xterm-color # wsvt26

if [[ "`uname`" != "OpenBSD" ]]
then
    setterm -blength 0
else
    #stty erase ^?
    ulimit -c 0
    umask u=rwx,g=,o=  ##umask 0077
#    (pgrep -x sndiod || sndiod) 2>&1 > /dev/null
fi

if `tty -s` 
then 
	mesg n
	xhost local:root + > /dev/null
	calendar -A 3 -B 1 -f .dates_naissances
fi


#unset TERM

#export TERM=xterm-xfree86   # xterm-color, wsvt25
export IGNOREEOF=0              # directly exists when CTL-d is hit
export HISTFILE=~/.bash_history # file name to save commands history
export HISTFILESIZE=50          # size of in-file list of last commands
export HISTSIZE=100             # size of in-memory list of last commands
export HISTCONTROL=ignoredups   # do not save multiple executions of same command in history
shopt -s cmdhist                # saves multiple lines command
shopt -s autocd                 # if a directory is given with no command => cd to this dir
shopt -s cdspell                # corrects typos in dir names during cd
shopt -s dirspell               # corrects typos in dir names during completion 
shopt -s histappend             # appends in-memory commands history to in-file history, thus allowing merging histories from multiple XTerms
#shopt -s histreedit   # allows reedition of failed substitution
#shopt -s histverify   # allows to test substitution before sending command
#shopt -s hostcomplete # allows completion of hostname (after "@")
#shopt -s huponexit    # kills child processes
#shopt -s lithist      # Keeps newline chars into save commands instead of replacing by ;
#shopt -s no_empty_cmd_completion # do not complete empty lines!
#shopt -s nocaseglob   # do not consider case in completion

export SVN_SSH="ssh -p 22"
export SVN_EDITOR="emacs"
export GIT_EDITOR="emacs"

export PRINTER=

alias ls='ls -hl --color'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias mplayer='mplayer -vo xv -ao alsa -zoom' 
alias startx='~/.mystartx'
alias xemacs='emacs' #'~/.myxemacs'
alias vi='vim'
alias rm='/bin/myrm'
alias clear='clear -T vt220'
alias qemu='qemu-system-x86_64 -m 1024m -soundhw sb16 -net nic,model=rtl8139 -net user'
alias grepp='grep -A6 -B6 -i'
alias cat8='iconv -t utf-8 -f iso-8859-1'
alias unlink='cd `pwd -P`'
alias nolimit='ulimit -d $((3*`ulimit -d`))'

if [[ "$TERM" != "xterm" && "$TERM" != "xterm-color" && "$TERM" != "linux" && "$TERM" != "vt220" && "$TERM" != "wsvt25" && "$TERM" != "xterm-xfree86" ]]
then
  export PS1="\u@\h:\W$ "
else
  export PS1="\001[01;34m\002\u\001[00m\002@\h:\W$ "
fi

export PATH=$PATH:/usr/X11R6/bin/:/sbin:/usr/local/bin:/home/guillaume/Softs/

whereisjavac=`ls -l /etc/alternatives/javac | awk '{ print $11 }'`
export JDK_HOME=$(dirname $(dirname $whereisjavac))
export JAVA_HOME=${JDK_HOME}
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

