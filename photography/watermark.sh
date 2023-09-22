#!/bin/bash

# ~/bin/resizing.sh
#

echo
echo "This script will apply a watermark to each .jpg file in the current directory"
echo

while true; do

read -p "Do you wish to proceed? (y/n)" yn
echo
	case $yn in

		[yY] ) echo Applying the watermark...;
			break;;

		[nN] ) echo Process halted;
			exit;;
			
		* ) echo invalid response;;

	esac
done

echo
mogrify -gravity southeast -geometry +10+10 -draw "image Over 0,0 320,21 '/home/paul/watermark.png'" *.jp*g
