#!/bin/bash

# ~/bin/new-topical-note.sh

# New notes are created with the Zettelkasten system in mind.
#
# Add 'alias tn=~/bin/new-topical-note.sh' to '~/.bash_aliases' to make life easier
#

# Name the file - requires user input
echo
echo -e "----------------"
echo -e "New Topical Note"
echo -e "----------------"
echo
echo -e "This file will be saved to the specified topic directory "
echo
echo -en "Provide a title for the post: "

read INPUT

# Title in front matter
# Ensure first letter of each word is uppercase
# Source: https://stackoverflow.com/questions/12487424/uppercase-first-character-in-a-variable-with-bash (one day I'll figure out why this works!).
foo="$INPUT"
foo=( $foo )
foo="${foo[@]^}"
TITLE=$foo

# File name title. Replace spaces in the title with dashes
FILE_TITLE=${INPUT// /-}

# The date that will appear in the frontmatter
DATE=$(date "+%Y-%m-%d")

# The uid that will appear in the frontmatter
UNIQUE=$(date "+%Y%m%d%H%M%S")

# Date in the format required for the file title prefix
PREFIX=$(date "+%Y-%m-%d")

# Filename
FILENAME="$PWD/$PREFIX-$FILE_TITLE.md"

# Create the file
{
    echo -e "---"
    echo -e "date: $DATE"
    echo -e "uid: $UNIQUE"
    echo -e "author: Paul Dürnberger"
    echo -e "title: $TITLE"
    echo -e "category: albums connection family person"
    echo -e "tags: []"
    echo -e "synopsis: "
    echo -e "---"  
} > $FILENAME

# Edit the file
nvim \
    -c "norm G2o" \
    -c "norm zz" \
    $FILENAME 

