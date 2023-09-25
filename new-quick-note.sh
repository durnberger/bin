#!/bin/bash

# ~/bin/new-quick-note.sh

# To make life easier add
#
#   'alias nq=~/bin/new-quick-note.sh'
#
# to '~/.bash_aliases'
#

# Switch to the notes directory 
cd ~/Documents/Writing/002-Notes/ 

# Filename
FILENAME=$(date +"%Y-%m-%d").md

# Date in the frontmatter
DATE=$(date +"%Y-%m-%d")

# UID in the frontmatter 
UNIQUE=$(date +"%Y%m%d%H%M%S")

# Timestamp
TIMESTAMP=$(date +"%H:%M:%S")

# If today's quick note doesn't exist, create it
if [ ! -f "$FILENAME" ]; then 

    # Create the file 
    touch $FILENAME
    
    {
        echo -e "---"
        echo -e "date: $DATE"
        echo -e "uid: $UNIQUE"
        echo -e "author: Paul Dürnberger"
        echo -e "title: Quick Note"
        echo -e "tags: [note]"
        echo -e "---"
        echo
        echo -e "## $TIMESTAMP"
        echo
    } >> $FILENAME

    # Edit the newly created file
    $EDITOR $FILENAME

else
    # If the quick note already exists, add a new 
    # timestamp and then open it
    {
        echo -e "## $TIMESTAMP"
        echo
    } >> $FILENAME

    # Edit the file
    $EDITOR $FILENAME 

fi

