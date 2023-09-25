#!/bin/bash

# ~/bin/new-daily-note.sh

# To make life easier add
#
#   'alias nd=~/bin/new-daily-note.sh'
#
# to '~/.bash_aliases'
#

# Current Year
YEAR=$(date +%Y)

# Year directory 
JOYEAR=~/Documents/Writing/001-Journal/$YEAR 

# Check the year directory exists 
if [ ! -d $JOYEAR ]; then
        mkdir -p $JOYEAR
fi

# Switch to this years directory 
cd $JOYEAR

# Filename
FILENAME=$(date +"%Y-%m-%d-%A").md

# Date in the frontmatter
DATE=$(date +"%Y-%m-%d")

# UID in the frontmatter 
UNIQUE=$(date +"%Y%m%d%H%M%S")

# Frontmatter title
TITLE=$(date +"%A")

# First line
FIRSTLINE=$(date +"%A %d %B %Y")

# If the daily note doesn't exist, create it
if [ ! -f "$FILENAME" ]; then 

    # Create the file 
    touch $FILENAME
    
    {
    echo -e "---"
    echo -e "date: $DATE"
    echo -e "uid: $UNIQUE"
    echo -e "author: Paul Dürnberger"
    echo -e "title: $TITLE"
    echo -e "tags: [ ]"
    echo -e "---"
    echo
    echo -e "$FIRSTLINE"
    echo
    echo
    } >> $FILENAME

    # Edit the newly created file
    $EDITOR $FILENAME

else
    # If the daily note already exists, open it
    $EDITOR $FILENAME 

fi

