#!/bin/bash

# ~/bin/writing-selection.sh

# -----------------------------------------------------
# Variables

# Colours
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m'	# NC=no colour

# Writing Directory
WRIDIR=~/Documents/Writing

# Script Directory
BIN=~/bin

# Current Year
YEAR=$(date +%Y)

# -----------------------------------------------------
# Process

echo -e ${LIGHTGREEN}
echo -e "-----------------"
echo -e "Writing Selection"
echo -e "-----------------"
echo -e ${NC}

# Choices
#
echo -e "Select from:"
echo
echo -e "1) Daily Note"
echo -e "2) Quick Note"
echo -e "3) Family History"
echo -e "4) Technology"
echo -e "5) Correspondence"

echo 

read choice

if [ "$choice" == "1" ]; then
    # Daily note
    bash $BIN/write/new-daily-note.sh

elif [ "$choice" == "2" ]; then
    # Quick Note 
    bash $BIN/write/new-quick-note.sh

elif [ "$choice" == "3" ]; then
    # Family History
    cd $WRIDIR/Family_History/posts/ 
    bash $BIN/write/new-topical-note.sh

elif [ "$choice" == "4" ]; then
    # Technology
    TECHYEAR=$WRIDIR/Technology/posts/$YEAR 
    if [ ! -d $TECHYEAR ]; then 
        mkdir -p $TECHYEAR 
    fi 

    cd $TECHYEAR 
    bash $BIN/write/new-topical-note.sh

elif [ "$choice" == "5" ]; then
	# Correspondence
	bash $BIN/write/new-correspondence.sh

else
	# Exit
	echo -e "Goodbye!"
	echo
	exit

fi
