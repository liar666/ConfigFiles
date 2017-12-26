#!/usr/bin/env bash

\rm -fr NonEncrypted/

# Copy the original files
\mkdir NonEncrypted/
\cp -r Linux/ OpenBSD/ NonEncrypted/

# Encrypt the copies to temp files
find NonEncrypted/ -type f | while read f
do
    . ~/Softs/simple_encrypt.sh -dec ${f} 10 > ${f}.enc
done

# Overwrite the copies file with encrypted temp files
find NonEncrypted/ -type f -name '*.enc' | while read f
do
    \mv -f ${f} ${f%.enc}
done
