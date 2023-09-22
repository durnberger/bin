#!/bin/bash
#

# ~/bin/rip-options

# Colours
#
RED='\033[0;31m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m'	# NC=no colour

# Heading
#
echo -e $LIGHTGREEN
echo -e "-------------"
echo -e " RIP Options "
echo -e "-------------"
echo -e $NC

# CD to the ~/Music directory
#
cd ~/Music

# Choices
#
echo -e "Select from:"
echo
echo -e "1) Rip CD to FLAC"
echo -e "2) Rip CD to MP3"
echo -e "3) Convert FLAC to MP3"
echo -e "4) Quit"
echo
read choice
echo

if [ "$choice" == "1" ]; then
	# CD to FLAC
	#
	bash ~/bin/rip/rip-cd2flac.sh


elif [ "$choice" == "2" ]; then
	# CD to MP3
	#
	bash ~/bin/rip/rip-cd2mp3.sh

elif [ "$choice" == "3" ]; then
	# Convert FLAC to MP3
	#
	bash ~/bin/rip/rip-flac2mp3.sh

else
	# Exit
	#
	echo -e "Goodbye!"
	echo
	exit

fi
