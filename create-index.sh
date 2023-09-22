#!/bin/bash

# Used in conjunction with Obsidian to create a 'map of content' page
#

# Break down the directory path
# (https://stackoverflow.com/questions/10986794/remove-part-of-path-on-unix/31728689#31728689)
d1=$(pwd | rev | cut -f1 -d'/' - | rev)
d2=$(pwd | rev | cut -f2 -d'/' - | rev)

FILENAME="$d1-MOC"

# Delete prior version of the $FILENAME page
rm -f $FILENAME.md

# Create the new index page
{
  ## Breadcrumbs
  #echo -e "[[0-Home|Home]]"
  #echo

  # Contents
  echo -e "## Contents"
  echo

} >> $FILENAME.md

# Write a list of the files in the current directory to the new index page
LIST=$(ls -R) 

for POST in $LIST; do

  echo [[$POST]] >> $FILENAME.md 

done
 








