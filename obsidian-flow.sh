#!/bin/bash

# Used in conjunction with the Obsidian text editor
#

# Start the Obsidian editor
# 'obsidian' is a symbolic link I have created to the obsidian appimage
# Both the link and the appimage are in '~/bin'
# 
obsidian &

# Variables
# 
DAY=$(date +"%A")
DATE=$(date +"%Y-%m-%d")
ID=$(date +"%Y%m%d%H%M%S")
SOURCE=/home/paul/Documents/Writing/Notes/journal.md 
DESTINATION="/home/paul/Documents/Writing/Journal/$DATE-$DAY".md
WORDCOUNT=$(cat $SOURCE | wc -m)

# Check if there is any text in the $SOURCE file
# If there is, continue to run the script
#
if [ $WORDCOUNT -gt 0 ]; then

    # If $DESTINATION doesn't exist, create it
    #
    if [ ! -f "$DESTINATION" ]; then
        {
            echo -e "---"
            echo -e "uid: $ID"
            echo -e "tags: [note, daily]"
            echo -e "---"
            echo
            echo -e "# $DAY" 
            echo
        } > $DESTINATION
    fi

    # Copy text from $SOURCE and paste into $DESTINATION
    # 'printf "\n"' produces a line break after the pasted text  
    #
    (cat $SOURCE; printf "\n"; printf "\n") >> $DESTINATION

    # Delete $SOURCE
    #
    rm $SOURCE

    # Create a new blank $SOURCE
    #
    touch $SOURCE

fi 
