#!/bin/bash

# ~/bin/resizing.sh
#

echo
echo "This script will resize '.jpg' files in the current directory"
echo

while true; do

read -p "Do you wish to proceed? (y/n)" yn
echo
	case $yn in

		[yY] ) echo Resizing...;
			break;;

		[nN] ) echo Process halted;
			exit;;
			
		* ) echo invalid response;;

	esac
done

echo
mogrify -resize 1024 -quality 80  *.jp*g
