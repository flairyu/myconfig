#!/bin/bash
echo "Welcome!"
echo "you need install imagemagick toolbox first!"

if [[ $# -eq 0 ]]; then
    echo "ver: 1.0.0"
    echo "Usage:"
    echo "genicon image [width] [height]"
    echo "Example:"
    echo "genicon image.png 32 32"
    exit
fi

IMG=$1
WIDTH=$2
HEIGHT=$3
IMGWIDTH=$(identify -format %w $IMG)
IMGHEIGHT=$(identify -format %h $IMG)

if [ -z "$WIDTH" ]; then
  WIDTH=$(($IMGWIDTH/4))
fi

if [ -z "$HEIGHT" ]; then
  HEIGHT=$(($IMGHEIGHT/4))
fi

echo "origin file $IMG size is $IMGWIDTHx$IMGHEIGHT"
echo "will convert to $WIDTHx$HEIGHT, in mdpi mode for android"

imgconvert() {
   local DPI=$1
   local SCALE=$2
   local W=$(echo "$WIDTH * $SCALE"|bc)
   local H=$(echo "$HEIGHT * $SCALE"|bc)
   echo "Convert - $DPI - ${SCALE}x - ${W}x${H}"
   if [ "$DPI" = "ios" ]; then
       local TODIR=output/ios
       mkdir -p $TODIR
       if [ $SCALE -ne 1 ]; then
           local filename=$(basename "$IMG")
           local extension="${filename##*.}"
           filename="${filename%.*}"
           convert $IMG -resize ${W}x${H} "$TODIR/${filename}@${SCALE}x.${extension}"
       else
           convert $IMG -resize ${W}x${H} "$TODIR/$IMG"
       fi
   else
       local TODIR=output/drawable-$DPI
       mkdir -p $TODIR
       convert $IMG -resize ${W}x${H} "$TODIR/$IMG"
   fi
}

imgconvert ldpi 0.75
imgconvert mdpi 1.0
imgconvert hdpi 1.5
imgconvert xhdpi 2.0
imgconvert xxhdpi 3.0
imgconvert xxxhdpi 4.0
imgconvert ios 1
imgconvert ios 2
imgconvert ios 3

echo "Done"
