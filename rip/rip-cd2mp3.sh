#!/bin/bash
#
echo "This short script will rip CD's to MP3"
echo
#
# Rip CD to MP3
# abcde: -G tells 'abcde' to grab the album artwork.
# mp3: -b 320 is the highest quality setting.
#
abcde -o 'mp3:-b 320' -G
echo
