#!/bin/bash

# A program to convert mp4 to mp3 and embedd thumnail to
# the resulting mp3.

#     TO DO


convert_to_mp3_with_thumnail (){
    echo "Opening file $f"

    # Extract thumbnail from video
    # and save it to variable image.
    echo "Extracting thumbnail from $f";
    ffmpeg -i "$f" -ss 00:00:18 -vframes 1 "${f%.*}".png;
    image="${f%.*}".png;

    # convert mp4,mkv or any video to mp3
    echo "Begining conversion of $f to mp3.";
    ffmpeg -i "$f" -acodec libmp3lame -q:a 2 "${f%.*}.mp3";
    audio="${f%.*}.mp3";
    echo "Finished conversion of $f";

    #embedd thumbnail to mp4
    ffmpeg -i "$audio" -i "$image" -c copy -map 0 -map 1 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (Front)" "converted/$audio";

    #remove the temporary images and mp4
    rm "$image";
    rm "$audio";

    echo "finished converting $f and embedding thumbnail into mp3"

}

# make a directory for storing converted files
mkdir converted;

for f in *.mkv
do
    convert_to_mp3_with_thumnail;
done

for f in *.mp4
do
    convert_to_mp3_with_thumnail;

done

for f in *.webm
do
    convert_to_mp3_with_thumnail;

done
