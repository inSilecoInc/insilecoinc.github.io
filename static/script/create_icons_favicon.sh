#!/bin/bash

# using ImageMagick 6.9.12-98
convert static/img/logo.png -define icon:auto-resize=192,128,64,48,32,16 static/favicon.ico 
convert static/img/logo.png -resize 192x192 static/android-chrome-192x192.png
convert static/img/logo.png -resize 512x512 static/android-chrome-512x512.png
# see e.g. https://webhint.io/docs/user-guide/hints/hint-apple-touch-icons/
convert static/img/logo.png -resize 180x180 static/apple-touch-icon.png
convert static/img/logo.png -resize 32x32 static/favicon-32x32.png
convert static/img/logo.png -resize 16x16 static/favicon-16x16.png