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
echo -e "1) Daily Note (001-Journal)"
echo -e "2) New Random Note (002-Notes)"
echo -e "3) Family History"
echo -e "4) Technology"
echo -e "5) Travel"
echo -e "6) Correspondence"
echo
echo -e "7) Open the Writing Directory"
echo 

read choice

if [ "$choice" == "1" ]; then
	# Journal
    JOYEAR=$WRIDIR/001-Journal/$YEAR
    if [ ! -d $JOYEAR ]; then
        mkdir -p $JOYEAR
    fi

    cd $JOYEAR
    bash $BIN/new-daily-note.sh

elif [ "$choice" == "2" ]; then
    # Random Note
    cd $WRIDIR/002-Notes/ 
    bash $BIN/new-unique-note.sh

elif [ "$choice" == "3" ]; then
    # Family History
    cd $WRIDIR/Family_History/ 
    bash $BIN/new-unique-note.sh

elif [ "$choice" == "4" ]; then
    # Technology
    TECHYEAR=$WRIDIR/Technology/posts/$YEAR 
    if [ ! -d $TECHYEAR ]; then 
        mkdir -p $TECHYEAR 
    fi 

    cd $TECHYEAR 
    bash $BIN/new-unique-note.sh

elif [ "$choice" == "5" ]; then
    TRAVYEAR=$WRIDIR/Travel/posts/$YEAR
    if [ ! -d $TRAVYEAR ]; then
        mkdir -p $TRAVYEAR
    fi 

    cd $TRAVYEAR 
    bash $BIN/new-unique-note.sh 

elif [ "$choice" == "6" ]; then
	# Correspondence
	bash $BIN/new-correspondence.sh

elif [ "$choice" == "7" ]; then
	# Writing Directory 
    mc $WRIDIR

else
	# Exit
	echo -e "Goodbye!"
	echo
	exit

fi
