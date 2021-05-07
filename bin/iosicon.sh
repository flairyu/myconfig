#!/bin/bash
if [ -f pic.png ]; then
    echo "generating..."
    mkdir tmp.iconset
    sips -z 16 16     pic.png --out tmp.iconset/icon_16x16.png
    sips -z 32 32     pic.png --out tmp.iconset/icon_16x16@2x.png
    sips -z 32 32     pic.png --out tmp.iconset/icon_32x32.png
    sips -z 64 64     pic.png --out tmp.iconset/icon_32x32@2x.png
    sips -z 40 40     pic.png --out tmp.iconset/icon_20x20@2x.png
    sips -z 60 60     pic.png --out tmp.iconset/icon_20x20@3x.png
    sips -z 58 58     pic.png --out tmp.iconset/icon_29x29@2x.png
    sips -z 87 87     pic.png --out tmp.iconset/icon_29x29@3x.png
    sips -z 80 80     pic.png --out tmp.iconset/icon_40x40@2x.png
    sips -z 120 120     pic.png --out tmp.iconset/icon_40x40@3x.png
    sips -z 120 120     pic.png --out tmp.iconset/icon_60x60@2x.png
    sips -z 180 180     pic.png --out tmp.iconset/icon_60x60@3x.png
    sips -z 128 128   pic.png --out tmp.iconset/icon_128x128.png
    sips -z 256 256   pic.png --out tmp.iconset/icon_128x128@2x.png
    sips -z 256 256   pic.png --out tmp.iconset/icon_256x256.png
    sips -z 512 512   pic.png --out tmp.iconset/icon_256x256@2x.png
    sips -z 512 512   pic.png --out tmp.iconset/icon_512x512.png
    sips -z 1024 1024   pic.png --out tmp.iconset/icon_512x512@2x.png
    sips -z 1024 1024   pic.png --out tmp.iconset/icon_1024x1024.png
    mv tmp.iconset AppIcon.iconset
    echo "your icon is ready."
else
    echo "put pic.png as a source image to create the icon.icns"
fi
