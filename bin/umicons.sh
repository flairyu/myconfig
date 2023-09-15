#!/bin/bash
echo "Welcome!"
echo "you need install imagemagick toolbox first!"

if [[ $# -eq 0 ]]; then
    echo "ver: 1.0.0"
    echo "Usage:"
    echo "umicon image"
    echo "Example:"
    echo "genicon image.png"
    exit
fi

IMG=$1
IMGWIDTH=$(identify -format %w $IMG)
IMGHEIGHT=$(identify -format %h $IMG)
TODIR=output

mkdir -p $TODIR

echo "origin file $IMG size is ${IMGWIDTH}x${IMGHEIGHT}"

imgconvert() {
   local W=$1
   local H=$2
   local FMT=$3
   echo "will convert to ${W}x${H} format: $FMT"
   if [ -n "$FMT" ]; then
   local NEWIMG=${IMG%.*}.$FMT
   convert $IMG -resize ${W}x${H} "$TODIR/${W}x${H}_$NEWIMG"
   else
   convert $IMG -resize ${W}x${H} "$TODIR/${W}x${H}_$IMG"
   fi
}

imgconvert 16 16
imgconvert 20 20
imgconvert 24 24
imgconvert 32 32 
imgconvert 48 48 
imgconvert 64 64 
imgconvert 68 68 
imgconvert 96 96 
imgconvert 128 128 
imgconvert 256 256 
imgconvert 512 512 
imgconvert 256 256 ico

echo "Done"
