# Get & Loop on Research Domains
index_page=`wget -O - 'http://academic.research.microsoft.com/'`
echo -e "${index_page}" | \
grep -C 15 -i "all fields of study</span>" | grep "div class='option'" | sed -e 's/\/>/\n/g' | sed -e 's/class='\''option'\''//g' | grep span | grep -v Multidis | sed -e 's/type='\''checkbox'\''//g' | sed -e 's/[^>]*>\([A-Za-z& ]*\)<[^=]*='\''\([0-9]*\)'\''/\2 "\1"/g' | sort -n | \
while read -a num_title
do
    number=${num_title[0]}
    domain=`echo ${num_title[1]} ${num_title[2]} ${num_title[3]} | tr -d '"'`
    echo "Getting 100 first entries for best organizations in \"${domain}\""
    the_page=`wget -O - 'http://academic.research.microsoft.com/RankList?entitytype=4&topDomainID='${number}'&subDomainID=0&last=0&start=1&end=100' | iconv -f utf-8 -t ascii//TRANSLIT`
    echo "${the_page}" >> "journals_page_for_${domain}".html
    echo -e "${the_page}" | sed -nr 's/.*ctl([0-9]+)_hypName[^>]*[>]([^<]*)[<].*/\1-\2/p' > "journals_numbered_list_${domain}.text"
    echo -e "${the_page}" | sed -nr 's/.*ctl([0-9]+)_hypName[^>]*[>]([^<]*)[<].*/\2/p' | tr '\n' ',' > "journals_java_list_${domain}.text"
    echo -e "\n\n${domain}\n" >> journals_whole_list.text
    echo -e "${the_page}" | sed -nr 's/.*ctl([0-9]+)_hypName[^>]*[>]([^<]*)[<].*/\2/p' >> journals_whole_list.text
    sleep 2
done