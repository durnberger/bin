#!/bin/bash 

# Choices
#
echo 
echo -e "Select from: "
echo
echo -e "1) Write"
echo -e "2) Print"
echo -e "3) Open the Writing Directory"
echo


read choice

if [ "$choice" == "1" ]; then
    # Writing selection
    bash ~/bin/writing-selection.sh 

elif [ "$choice" == "2" ]; then
    # Printing options 
    bash ~/bin/print-options.sh 

elif [ "$choice" == "3" ]; then
    # Open the writing directory
    mc ~/Documents/Writing

else 
    echo -e "Invalid selection"

fi 

