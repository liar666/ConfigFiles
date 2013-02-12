VERSION=4.9
ARCH=amd64
SRC_LOCATION=./OpenBSD
mkisofs -vrTJV "OpenBSD${VERSION}" -no-emul-boot -b ${VERSION}/${ARCH}/cdbr -c boot.catalog -o OpenBSD${VERSION}.iso ${SRC_LOCATION}
