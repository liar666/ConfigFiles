if [[ $# != 1 ]]
then
    echo "USAGE $0 <name of CFE>"
else
    echo "SELECT q.id,q.text FROM query AS q JOIN cfe_query AS rel ON rel.query_id=q.id JOIN cfe ON cfe_queries_id=cfe.id WHERE cfe.internal_name='$1';" | psql sofia presans
fi