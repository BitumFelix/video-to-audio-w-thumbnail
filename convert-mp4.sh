#!/bin/bash

# A program to convert mp4 to mp3 and embedd thumnail to
# the resulting mp3.

#     TO DO




for f in *.mp4;
  do

  # Extract thumbnail from mp4
  ffmpeg -i $f -ss 00:00:18 -vframes 1 $f.png
  # And save to variable image
  echo "Opening file $f"
  var image

  # convert mp4 to mp3
  ffmpeg -i "$f" -acodec libmp3lame -q:a 2 "${f%.*}.mp3";

  #embedd thumbnail to mp4

  echo "finished converting and embedding thumbnail into mp3"
done