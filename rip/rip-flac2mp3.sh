#!/bin/bash
#
echo "A short script which will convert FLAC files to MP3s"
echo
#
# Using the command 'for' causes the script to process each FLAC file in turn.
# -c 	(flac) Write to stdout
# -d 	(flac) Decode file
# -b 	(lame) The bitrate to use when saving as mp3 (320 is the highest)
# - 	(lame) In this case it means read data from stdin
#
echo "Converting FLAC to MP3..."
for f in *.flac; do flac -cd "$f" | lame -b 320 - "${f%.*}".mp3; done
echo
