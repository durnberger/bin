#!/bin/bash
#
# ~/bin/nord.sh
#
# Colours
#
LIGHTRED='\e[1;31m'
LIGHTGREEN='\e[1;32m'
LIGHTBLUE='\e[1;34m'
RESET='\e[0m' # No colour

# Introduction
#
echo -e ${LIGHTGREEN}
echo -e "======="
echo -e "NordVPN"
echo -e "======="
echo -e ${RESET}

# Status
#
echo -e "------"
echo -e "Status"
echo -e "------"
nordvpn status
echo

# Options
#
echo -e "-------"
echo -e "Options"
echo -e "-------"
echo -e "Select from:"
echo
echo -e "1) 'nordvpn settings'"
echo -e "2) 'nordvpn connect'    - Connect to any available server"
echo -e "3) 'nordvpn-connect.sh' - Custom script. Connect to United_Kingdom"
echo -e "4) 'nordvon-restart.sh' - Custom script. Kill nordvpn and reconnect to any server"
echo -e "5) 'nordvpn disconnect' - Disconnect from server"
echo -e "6) Quit this script"
echo
read choice
echo

if [ "$choice" == "1" ]; then
	# nordvpn settings
	nordvpn settings
    echo

elif [ "$choice" == "2" ]; then
	# nordvpn connect
	nordvpn connect
    echo

elif [ "$choice" == "3" ]; then
	# nordvpn-connect.sh
	bash ~/bin/vpn/nordvpn-connect.sh

elif [ "$choice" == "4" ]; then
	# nordvpn-restart.sh
	bash ~/bin/vpn/nordvpn-restart.sh

elif [ "$choice" == "5" ]; then
    nordvpn disconnect
    echo 

elif [ "$choice" == "6" ]; then
  exit

else
	# Invalid selection
    while true; do

        read -p "Invalid selection. Would you like to try again? (y/n)" yn
        echo
            case $yn in

                [yY] ) echo Try again...;
                    break;;

                [nN] ) echo Process halted;
                    exit;;

                * ) echo invalid response;;

            esac
    done

    nord.sh

fi
