#/!bin/bash

# ~/bin/ttc.sh

# Output the 'date' command to the clipboard
#
TIMESTAMP=$(date "+%Y%m%d%H%M")
DATE=$(date "+%Y-%m-%d %H:%M")

{
  echo -e "date:" $DATE
  echo -e "uid:" $TIMESTAMP
  
} | xclip -sel clip

