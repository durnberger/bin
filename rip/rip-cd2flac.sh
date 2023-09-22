#!/bin/bash
#
echo "A short script to rip CD's to FLAC"
echo
#
# Rip CD to FLAC
# -1 is the lowest quality setting, -8 is the highest.
# -G tells 'abcde' to grab the album artwork.
#
abcde -o 'flac:-8' -G
echo
