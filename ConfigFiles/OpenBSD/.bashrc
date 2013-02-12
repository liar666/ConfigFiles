if [[ "`uname`" != "OpenBSD" ]]
then
    setterm -blength 0
else
    #stty erase ^?
    ulimit -c 0
    umask u=rwx,g=,o=  ##umask 0077
#    (pgrep -x sndiod || sndiod) 2>&1 > /dev/null
fi

unset TERM
export TERM=xterm-xfree86   # xterm-color, wsvt25

#export PKG_PATH="http://ftp2.fr.openbsd.org/pub/OpenBSD/`uname -r`/packages/`uname -m`"
#export PKG_PATH="http://ftp2.fr.openbsd.org/pub/OpenBSD/snapshots/packages/`uname -m`"
export PKG_PATH="http://ftp2.fr.openbsd.org/pub/OpenBSD/snapshots/packages/amd64"
export CVSROOT="anoncvs@anoncvs.fr.openbsd.org:/cvs"

export IGNOREEOF=0
export HISTFILESIZE=10
export HISTSIZE=20

export PGDATA="/usr/local/pgsql/data"

export SVN_SSH="ssh -p 22"
export SVN_EDITOR="xemacs"
export GIT_EDITOR="xemacs"

export PRINTER=HPPSC500local

alias ls='colorls -Ghl'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias mplayer='mplayer -vo sdl -ao sndio -zoom' 
alias startx='~/.mystartx'
alias xemacs='~/.myxemacs'
alias vi='vim'
alias rm='/bin/myrm'
alias clear='clear -T vt220'
alias qemu='nolimit ; qemu -m 1024m -soundhw sb16 -net nic,model=ne2k_pci -net user'
alias grepp='grep -A6 -B6 -i'
alias cat8='iconv -t utf-8 -f iso-8859-1'
alias unlink='cd `pwd -P`'
alias nolimit='ulimit -d $((3*`ulimit -d`))'
alias gpg='gpg2'

if [[ "$TERM" != "xterm" && "$TERM" != "xterm-color" && "$TERM" != "linux" && "$TERM" != "vt220" && "$TERM" != "wsvt25" && "$TERM" != "xterm-xfree86" ]]
then
  export PS1="\u@\h:\W$ "
else
  export PS1="\001[01;34m\002\u\001[00m\002@\h:\W$ "
fi

export PATH=/usr/lib/jdk1.5.0_08/bin/:$PATH:/usr/X11R6/bin/:/sbin:/home/guigui/Softs/:/usr/local/jdk-1.7.0/bin/:/sbin/:~/Jason-1.1.2/bin/:/usr/local/bin


whereisjavac=`which javac`
export JDK_HOME=$(dirname $(dirname $whereisjavac))
export JAVA_HOME=${JDK_HOME}
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.6/:.

#export LC_ALL=en_US.UTF-8
#export LC_CTYPE=en_US.UTF-8
#export LANG=en_US.UTF-8

# NOTE: the // indicates to LaTeX to get recursively into the subdirs.
#for i in  .  ~/.TeX/installedPkgs/*
#do
#  export TEXINPUTS=${i}//:$TEXINPUTS
#  export BIBINPUTS=${i}//:$BIBINPUTS
#  export BSTINPUTS=${i}//:$BSTINPUTS
#done

# # mostly for Xemacs+utf8
# export LC_ALL="en_US.UTF-8"
# export LANG="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
# export LC_COLLATE="C"
# export LC_TIME="C"
# export LC_NUMERIC="C"
# export LC_MONETARY="C"
# #export LC_MESSAGES="en_US.UTF-8"
# export LC_ALL=""


##unset TERM

calendar -A 5 -B 2 -f .dates_naissances
