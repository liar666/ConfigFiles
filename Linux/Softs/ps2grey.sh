if [[ $# != 2 ]] ; then
  echo "USAGE: $0 <input.ps> <output.ps>"
else
gs \
 -sOutputFile="$2" \
 -sDEVICE=ps2write \
 -sColorConversionStrategy=Gray \
 -dProcessColorModel=/DeviceGray \
 -dCompatibilityLevel=1.4 \
  "$1" < /dev/null
## convert -colorspace gray $1 $2
fi
