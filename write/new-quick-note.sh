#!/bin/bash

# With thanks to https://www.youtube.com/watch?v=zB_3FIGRWRU

# Switch to the notes directory  
DIR=~/Documents/Writing/Journal/notes 
cd $DIR 

# Today's date and time 
UNIQUE=$(date +"%Y%m%d%H%M%S")
DATE=$(date +"%A %d %B %Y")
TIMESTAMP=$(date +"%H:%M:%S")

# Filename
FILENAME=$UNIQUE.md

# Create the file
{
    echo -e "# $DATE" 
    echo -e "## $TIMESTAMP"
} > $FILENAME  

nvim \
    -c "norm G2o" \
    -c "norm zz" \
    $FILENAME

