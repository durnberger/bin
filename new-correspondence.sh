#!/bin/bash

# ~/bin/new-correspondence.sh

# Add 'alias nc=~/bin/correspondence.sh' to '~/.bash_aliases' to make life easier
#

# Name the file - requires user input
echo
echo -e "New Correspondence"
echo -e "------------------"
echo
echo -n "Provide a title for the correspondence: "

read INPUT

# Heading
# Ensure first letter of each word is uppercase
# Source: https://stackoverflow.com/questions/12487424/uppercase-first-character-in-a-variable-with-bash
# One day I'll figure out why this works!
foo="$INPUT"
foo=( $foo )
foo="${foo[@]^}"
TITLE=$foo

# File name title. Replace spaces in the title with dashes
FILE_TITLE=${INPUT// /-}

# YAML date
DATE=$(date "+%Y-%m-%d %H:%M")

# Date in the format required for the file title prefix
PREFIX=$(date "+%Y%m%d%H%M")

# Filename
FILENAME="$PREFIX-$FILE_TITLE.md"

# Date in a format to appear in the letter
TODAY=$(date "+%A %d %B %Y")

# Where to store the correspondence
DIRECTORY="/$HOME/Documents/Writing/Correspondence"

# Create the file
cd $DIRECTORY

touch $FILENAME
{
  echo -e "---"
  echo -e "date: $DATE"
  echo -e "author: $AUTHOR"
  echo -e "title: $TITLE"
  echo -e "---"
  echo -e "$TODAY"
  echo
  echo -e "Dear "
  echo
  echo -e "Subject: **$TITLE**"
  echo
  echo
  echo -e "Yours "
  echo
  echo
} >> $FILENAME

# Edit the file
$EDITOR $FILENAME

