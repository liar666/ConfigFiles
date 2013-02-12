OUT_DIR="~/tmp/C#_API"
INITIAL_URL="http://msdn.microsoft.com/en-us/library/aa388745(VS.85).aspx"
URL_PREFIX="http://msdn.microsoft.com/en-us/library/"
USERAGENT="Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)"
#USERAGENT="Mozilla/5.0 (X11; U; OpenBSD i386; en-US; rv:1.9.1.6) Gecko/20091226 Firefox/3.5.6"

NEXT_PAGES_FILE="./nextpages.lst"

mkdir ${OUT_DIR} ; cd ${OUT_DIR}
echo ${INITIAL_URL} > "${NEXT_PAGES_FILE}"

while [[ -e "${NEXT_PAGES_FILE}" ]]
do
  echo "Testing if there remain pages to be downloaded"
  TEST=`head -n 1 ${NEXT_PAGES_FILE} | tr -d ' '`
  if [[ ${TEST} == "" ]]
  then
      rm ${NEXT_PAGES_FILE}{,.tmp,.tmp2}
  else
        echo "------------------------------------------"
	echo "Getting the pages listed in ${NEXT_PAGES_FILE}"
	wget --no-http-keep-alive --restrict-file-names=nocontrol -nc --random-wait --wait=$(($RANDOM/200)) -U "${USERAGENT}" -i "${NEXT_PAGES_FILE}"
	echo "------------------------------------------"
	echo "Parsing pages to find referred URLs"
	echo -n "" > ${NEXT_PAGES_FILE}.tmp
	for url in `cat ${NEXT_PAGES_FILE}`
	do
	  file=`basename ${url}` 
	  echo "Parsing file: ${file}"
	  echo "------------------------------------------"
	  echo "Adding referred URLs of ${file} to temporary NEXT_PAGES_FILE: ${NEXT_PAGES_FILE}.tmp, while 'uniq'ing the whole list"
	  (cat ${file} | tr ' ' '\n' | grep -e '\.aspx"$' | grep ${URL_PREFIX} | sed 's/href=\"\([^"]*\)\"/\1/g' ; cat ${NEXT_PAGES_FILE}.tmp) | sort | uniq > ${NEXT_PAGES_FILE}.tmp2
	  mv -f ${NEXT_PAGES_FILE}.tmp2 ${NEXT_PAGES_FILE}.tmp
	  echo "URLs referred in file: ${file}"
	  cat ${NEXT_PAGES_FILE}.tmp
	done
	mv -f ${NEXT_PAGES_FILE}.tmp ${NEXT_PAGES_FILE}
  fi
done

cd -

#  echo "firefox35 -new-tab '${IMGURL}'"
