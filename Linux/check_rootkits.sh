for mach in k1 k2 bio
do
    ssh ${mach}:/tmp/chkrootkit.log /tmp/${mach}_chkrootkit.log
    ssh ${mach}:/tmp/rkhunter.log   /tmp/${mach}_rkhunter.log
    mesg="To: gm@presans.com\nFrom: gm@presans.com\nSubject: RootKits@${mach}\n\n$(cat /tmp/${mach}_chkrootkit.log)\n\n\n\n$(cat /tmp/${mach}_rkhunter.log)"
    echo -e "${mesg}" | ssmtp gm@presans.com
done
