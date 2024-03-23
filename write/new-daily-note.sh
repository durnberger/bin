#!/bin/bash

# With thanks to https://www.youtube.com/watch?v=zB_3FIGRWRU

# Switch to the notes directory  
DIR=~/Documents/Writing/Journal/current_year/ 
cd $DIR 

# Today's date and time 
DAY=$(date +"%A")
DATE=$(date +"%Y-%m-%d")
TIMESTAMP=$(date +"%H:%M:%S")

# Filename
FILENAME="$DATE-$DAY".md

# If today's quick note doesn't exist, create it
if [ ! -f "$FILENAME" ]; then 
    # Create the file
    {
        echo -e "# $FILENAME"
        echo
        echo -e "Tagged: #tags"

    } > $FILENAME  
fi

nvim \
    -c "norm Go" \
    -c "norm Go## $TIMESTAMP" \
    -c "norm G2o" \
    -c "norm zz" \
    $FILENAME
