#!/bin/bash

# Find files that contain a chosen word, and add a wiki link for that word to the end of matching files.

# grep
# l: print only names of files with matches
# r: recursive
#
# sed
# $ :the last line of the file
# i :save the edited file in place (ie, overwrite exisitng file)
# e :script to be executed
# a :append text after a line
#   :'$ a' means append the text after last line
# G :append a new line 
#   :with no other switches the line will be empty
#   :'$ G' means append after the last line 

read -p "Enter a tag name: " WORD
echo -e "The entered word is" $WORD
echo

read -r -p "Do you wish to proceed? [Y/n] " input
 
case $input in
      [yY][eE][sS]|[yY])
            grep -lr $WORD | xargs sed -i -e '$ G' -e '$ a [['$WORD']]'
            ;;
      [nN][oO]|[nN])
            exit 1
            ;;
      *)
            echo "Invalid input..."
            exit 1
            ;;
esac

echo
