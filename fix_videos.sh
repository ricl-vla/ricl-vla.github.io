#!/bin/bash

mkdir -p static/videos_cropped_reencoded
cd static/videos_cropped
for file in *.mp4; do
    if [ -f "../videos_cropped_reencoded/$file" ]; then
        echo "File $file already exists in static/videos_cropped_reencoded"
    else
        ffmpeg -i "$file" -c:v libx264 -preset faster -crf 18 -c:a aac -b:a 128k "../videos_cropped_reencoded/$file"
    fi
done