. ../DownloadScripts/fakeuseragent.sh
FAKE_AGENT=`gen_fake_uagent`

BASE_URL=http://arxiv.org

LOG_FILES=list_of_publication_pdf_urls.text

results=`wget -U "${FAKE_AGENT}" -O - '${BASE_URL}'`

domains=`echo $results | sed -e 's/>/>\n/g' | grep new | grep '/list/' | grep '<a href' | cut -d '"' -f 2 | sort`

echo $domains

for dom in $domains
do
    short=`echo $dom | cut -d '/' -f 3`
    mkdir -p "$short"
    cd "$short"
    newPapers=`wget -U "${FAKE_AGENT}" -O - '${BASE_URL}/$dom'`
    urls=`echo "$newPapers" | sed -e 's/>/>\n/g' | grep '/pdf/' | cut -d '"' -f 2 | sort | uniq`
    for u in $urls
    do
	fullurl="${BASE_URL}/$u"
     	wget -U "${FAKE_AGENT}" '${fullurl}'
	echo ${fullurl} >> ${LOG_FILES}
        # Preparing next iteration
	FAKE_AGENT=`gen_fake_uagent`
	rdm=$((RANDOM%10))
	echo "Sleeping $rdm seconds"
	sleep $rdm
    done # URLS
    for i in *
    do
     	mv $i $i.pdf
    done
    cd ..
done # DOMAINS

# Remove doubles
. ../remove_doubles.sh