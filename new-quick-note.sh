#!/bin/bash

# With thanks to https://www.youtube.com/watch?v=zB_3FIGRWRU

# Switch to the notes directory  
DIR=~/Documents/Writing/Unsorted_Notes/ 
cd $DIR 

# Today's date and time 
DATE=$(date +"%Y-%m-%d")
TIMESTAMP=$(date +"%H:%M:%S")

# UID in the frontmatter 
UNIQUE=$(date +"%Y%m%d%H%M%S")

# Filename
FILENAME=$DATE.md

# If today's quick note doesn't exist, create it
if [ ! -f "$FILENAME" ]; then 
    # Create the file
    {
        echo -e "# Note: $DATE" 
    } > $FILENAME  
fi

nvim \
    -c "norm Go" \
    -c "norm Go## $TIMESTAMP" \
    -c "norm G2o" \
    -c "norm zz" \
    $FILENAME
