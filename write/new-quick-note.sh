#!/bin/bash

# With thanks to https://www.youtube.com/watch?v=zB_3FIGRWRU

# Switch to the notes directory  
DIR=~/Documents/Writing/Notes/ 
cd $DIR 

# Date 
DATE=$(date +"%A %d %B %Y")

# ID using oday's date and time
ID=$(date +"%Y%m%d%H%M%S")

# Filename
FILENAME=$ID.md

# Create the file
{
    echo -e "---"
    echo -e "uid: $ID "
    echo -e "tags: []"
    echo -e "---"
    echo
    echo -e "# title"
    echo
    echo -e "$DATE"
    echo
} > $FILENAME

nvim \
    -c "norm Go" \
    -c "norm zz" \
    $FILENAME

