if [[ $# != 2 ]] ; then
  echo "USAGE: $0 <input.pdf> <output.pdf>"
else
gs \
 -sOutputFile="$2" \
 -sDEVICE=pdfwrite \
 -sColorConversionStrategy=Gray \
 -dProcessColorModel=/DeviceGray \
 -dCompatibilityLevel=1.4 \
  "$1" < /dev/null
## convert -colorspace gray $1 $2
fi
