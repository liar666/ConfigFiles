if [[ $# != 1 ]] ; then
    echo "USAGE: $0 <path to places.sqlite>"
    echo "requires: package sqlite3-pcre"
else
    placesPATH=$1
    sqlite3 ${placesPATH} <<EOF
-- Load plugin to manage Regexes
.load /usr/lib/sqlite3/pcre.so
-- Remove the constraint of unicity on the url field
DROP INDEX moz_places_url_uniqueindex;
-- replace the corrupted entries with one digit
UPDATE moz_places SET url=substr(url,13) WHERE url REGEXP 'wyciwyg://[0-9]/';
-- replace the corrupted entries with two digits
UPDATE moz_places SET url=substr(url,14) WHERE url REGEXP 'wyciwyg://[0-9][0-9]/';
-- replace the corrupted entries with three digits
UPDATE moz_places SET url=substr(url,15) WHERE url REGEXP 'wyciwyg://[0-9][0-9][0-9]/';
-- replace the corrupted entries with four digits
UPDATE moz_places SET url=substr(url,16) WHERE url REGEXP 'wyciwyg://[0-9][0-9][0-9][0-9]/';
-- Remove the duplicates
DELETE FROM moz_places WHERE id IN (SELECT id FROM moz_places GROUP BY moz_places.url HAVING COUNT(*)>1);
-- Restore the unicity of the url field
CREATE UNIQUE INDEX moz_places_url_uniqueindex ON moz_places (url);
EOF
fi

# Script written thanks to the help of:
# http://www.alekz.net/archives/740?ModPagespeed=noscript
# http://www.quake3world.com/forum/viewtopic.php?f=13&t=41760
# http://www.sqlite.org/lang_corefunc.html#replace
# http://www.sqlite.org/lang_corefunc.html#substr
# http://stackoverflow.com/questions/5071601/how-do-i-use-regex-in-a-sqlite-query
