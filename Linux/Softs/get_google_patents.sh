. ../DownloadScripts/fakeuseragent.sh
FAKE_AGENT=`gen_fake_uagent`
NUMBER_OF_RESULTS=200

LOG_FILES=list_of_patent_pdf_urls.text

QUERYS=biology,computer,drosophila,earth,express,extraction,flies,game,glass,ground,learning,magnet,mechnics,mouse,oil,petrol,physics,power,quote,sex,soil,translate,try

for QUERY in `echo $QUERYS | tr ',' "\n"`
do
    mkdir -p ${QUERY}
    cd ${QUERY}
    echo "Searching patents with keyword $QUERY" > /dev/stderr
    # 1. get source of the page of a search with particular keywords
    # 'http://www.google.com/search?tbm=pts&q=patent+pdf+'${QRY}
    # QRY="site:www.google.com/?tbm=pts+patent+${QUERY}+pdf"
    # SEARCH_URL="http://www.google.com/search?ie=ISO-8859-1&num=${NUMBER_OF_RESULTS}&hl=en&source=hp&q=${QRY}#q=${QRY}"
    SEARCH_URL="http://www.google.com/search?tbm=pts&num=${NUMBER_OF_RESULTS}&q=patent+pdf+${QUERY}"    
    echo "Getting ${SEARCH_URL}"
    RESULT_PAGE=`wget -U "${FAKE_AGENT}" -O - '${SEARCH_URL}'`
    #echo "${RESULT_PAGE}"

     # 2. search for "https://www.google.com/patents/" in this page
     PATENTS_URLS=`echo "${RESULT_PAGE}" | sed -e 's/>/>\n/g' | grep "google.com/patents/" | grep -v '<img' | cut -d "\"" -f2 |cut -d '?' -f 1 | sort | uniq`
     #echo "${PATENTS_URLS}"

     for pg in ${PATENTS_URLS}
     do
        # 3. get source of these pages
 	echo "Getting ${pg}"
	PROTOCOL=`echo ${pg} | cut -d '/' -f 1`
 	RESULT_PG=`wget -U "${FAKE_AGENT}" -O - '${pg}'`
 	# 4. search for "//patentimages.storage.googleapis.com/pdfs/US8446367.pdf" in these pages
 	PATENT_PDF_URL=`echo ${RESULT_PG} | sed -e 's/>/>\n/g' | grep 'patentimages.storage.googleapis.com/pdfs' | grep -v viewer | cut -d '"' -f 4`
        # 5. download the pdf
	echo "Will download PDF: ${PATENT_PDF_URL}"
        if [[ "${PATENT_PDF_URL}"x != ""x ]]
	then
	    wget -U ${FAKE_AGENT} '${PROTOCOL}${PATENT_PDF_URL}'
	    echo "${PROTOCOL}${PATENT_PDF_URL}" >> ${LOG_FILES}
	fi
        # Preparing next iteration
	FAKE_AGENT=`gen_fake_uagent`
	rdm=$(($RANDOM%6))
	echo "Sleeping $rdm seconds"
	sleep $rdm
     done # PATENTS_URLS
     cd ..
done # QUERYS

# Remove doubles
. ../remove_doubles.sh
