#!/bin/bash

# ~/bin/photography.sh
#

RED='\e[1;91m'
NOCOLOR='\e[0m'

# Introduction
#
echo
echo -e "======================="
echo -e "Watermarks and Resizing"
echo -e "======================="
echo

echo -e "This script will resize '.jpg' files in the current directory or apply"
echo -e "a watermark to each, or complete both actions"
echo
echo -e "These processes will ${RED}overwrite the exisiting images${NOCOLOR}."
echo -e "Ensure you are in the correct directory before proceeding"

echo
cwd=$(pwd)
echo -e "The current directory is:"
echo -e "${RED}$cwd${NOCOLOR}"
echo

# Choices
#
echo -e "Select from:"
echo
echo -e "1) Apply a watermark"
echo -e "2) Resize the images"
echo -e "3) Both: watermark and resize"
echo -e "4) Quit"
echo
read choice
echo

if [ "$choice" == "1" ]; then
	# Watermark
	bash ~/bin/photography/watermark.sh


elif [ "$choice" == "2" ]; then 
	# Resize
	bash ~/bin/photography/resizing.sh
	
elif [ "$choice" == "3" ]; then 
	# Both watermark and resize
	bash ~/bin/photography/watermark.sh
	bash ~/bin/photography/resizing.sh

else
	# Exit
	echo "Process halted"
	echo
	exit

fi
