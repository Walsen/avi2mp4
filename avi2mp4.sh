#!/bin/bash
find . -type f -iname "*.avi" -print0 | while IFS= read -r -d $'\0' file
do
    dst="${file%.*}.mp4"
    if [ ! -f "$dst" ]
    then
        ffmpeg -i "$file" -vcodec libx264 -crf 18 -acodec copy "$dst" </dev/null
    fi
done
