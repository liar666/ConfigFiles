. ../DownloadScripts/fakeuseragent.sh

FAKE_AGENT=`gen_fake_uagent`

QUERYS=africa,airplane,area,attribute,bark,biology,blast,blend,boast,bump,business,capital,challenge,chap,chase,climate,climb,clinical,college,computer,crawl,crime,cry,development,dream,drosophila,earth,education,equilibrium,express,extraction,faint,family,fitness,flies,float,fly,food,frown,game,glass,governance,government,groan,ground,guide,hide,hike,hop,house,how,human,ideas,internet,joke,jump,justice,learning,library,magnet,maps,mechnics,medicine,melt,modern,mouse,nation,oil,paddle,people,perspective,petrol,physics,politics,power,quote,racial,science,selection,sex,soil,source,space,student,sustain,teacher,temple,translate,try,urban,vaccine,virtual,water,what,when,who,work
# advertising,
# series

LOG_FILES=list_of_other_pdf_urls.text

for q in `echo $QUERYS | sed -e 's/,/\n/g'`
do
    mkdir -p $q
    cd $q
    for PAGE in {1..6}
    do
	result=`wget -U "${FAKE_AGENT}" -O - 'http://www.pdfgeni.com/search?q='${q}'%2Bpdf&page='${PAGE}`
	pdfs=`echo "$result" | sed -e 's/>/>\n/g' | grep http | grep -v "pdfgeni" | grep -v img | grep -v onlineview | sed -e "s/=' */='/g" | cut -d '=' -f 2 | cut -d  ' ' -f 1 | grep '.pdf' | tr -d \' | sort | uniq`
	for pdfurl in $pdfs
	do
	    wget -U "${FAKE_AGENT}" $pdfurl
	    echo "$pdfurl" >> ${LOG_FILES}
	    # Preparing next iteration
	    FAKE_AGENT=`gen_fake_uagent`
	    rdm=$((RANDOM%10))
	    echo "Sleeping $rdm seconds"
	    sleep $rdm
	done # PDFURLS
    done # PAGE
    cd ..
done # QUERYS

# Removing files downloaded serveral times
find . -name '*.[0-9]' -exec rm -f '{}' \;

# Removing identical files (but leave one instance)
find . -name '*.pdf' | cut -d '/' -f 3 | sort | uniq -d | \
while read plop
do
    find . -name "${plop}" | head -n -1 | \
    while read k
    do
	/bin/rm "$k"
    done
done
