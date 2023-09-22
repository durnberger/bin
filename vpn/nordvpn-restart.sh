#!/bin/bash
#
# Used on those occasions NordVPN beocmes unresponsive.
#

RED="\e[1;31m"		# Light red
COLOR='\e[1;32m' 	# Light green
RESET='\e[0m'		# Default color

echo
echo -e "${RED}A Script to Restart the NordVPN Daemon${RESET}"
echo
echo -e "${COLOR}Running 'sudo killall nordvpnd'...${RESET}"
sudo killall nordvpnd
echo

sleep 5s

echo -e "${COLOR}Running 'sudo systemctl restart nordvpnd'...${RESET}"
sudo systemctl restart nordvpnd
echo

sleep 5s

echo -e "${COLOR}Running 'nordvpn connect'...${RESET}"
nordvpn connect
echo

echo -e "${COLOR}Checking nordvpn status...${RESET}"
nordvpn status
echo
