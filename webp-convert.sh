#!/bin/bash

# converting JPEG images
# find $1 -type f -and -mtime -2 -iname "*.jpg" \

find $1 -mtime -4000 -type f -and -iname "*.jpg" \
-exec bash -c '
webp_path=$(sed 's/\.[^.]*$/.jpg.webp/' <<< "$0");
if [ ! -f "$webp_path" ]; then 
  cwebp -quiet -q 85 "$0" -o "$webp_path";
fi;' {} \;

# converting PNG images
#find $1 -type f -and -mtime -2 -iname "*.png" \

find $1 -mtime -4000 -type f -and -iname "*.png" \
-exec bash -c '
webp_path=$(sed 's/\.[^.]*$/.png.webp/' <<< "$0");
if [ ! -f "$webp_path" ]; then 
  cwebp -quiet -lossless "$0" -o "$webp_path";
fi;' {} \;
