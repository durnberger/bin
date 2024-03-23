#!/bin/bash 

VAULT=~/Documents/Writing/Journal/
FILES=$VAULT/current_year/
ARCHIVE=$VAULT/archive/

cd $FILES

# Find any files in the `currnt_year` directory that were modified 
# more than 180 days ago. Move any files found to the `archive`
#
find -mtime +180 > list.txt

# Use `grep` to check if `list.txt` contains any entries. If there
# are any, process the listed items.
# q = quiet and return an exit code
# . = a regular expression that matches any character
#
if grep -q . "list.txt"; then

    for OLD_FILE in `cat list.txt`
    do
        mv $OLD_FILE $ARCHIVE
    done

    # cd to the `archive` directory.
    # Extract the year from the file name, and move the file to
    # the corresponding year directory. If the year directory
    # doesn't exist, create it before moving the file.
    #
    cd $ARCHIVE

    for ITEM in ./*.md
    do
        # The year in the format `yyyy` are always the first 4
        # characters of my saved file names, ie `yyyy-MM-dd-title.md`. 
        # The following selects those first 4 characters
        YEAR=${ITEM:2:4}
        
        # If the `year` directory doesn't exist, create it
        if [ ! -d $YEAR ]; then
            mkdir -p $YEAR
        fi
        
        # Move the file to the `year` directory
        mv $ITEM $YEAR
    done

else
    # If `list.txt` contains no entries, do nothing.
    echo "No action required"
fi

# Tidy up 
rm $FILES/list.txt

