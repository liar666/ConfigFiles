\rm -fr Encrypted/

# Copy the original files
\mkdir Encrypted/
\cp -r Linux/ OpenBSD/ Encrypted/

# Encrypt the copies to temp files
find Encrypted/ -type f | while read f
do
    . ~/Softs/simple_encrypt.sh -enc ${f} 10 > ${f}.enc
done

# Overwrite the copies file with encrypted temp files
find Encrypted/ -type f -name '*.enc' | while read f
do
    \mv ${f} ${f%.enc}
done
