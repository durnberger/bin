#! /bin/bash

# Log out, reboot or power-off using the rofi interface
# A variation of a script written by jmutai@computingforgeeks.com
#

option=`echo -e "Lock Screen\nLog Out\nReboot\nPower Off" | rofi -width 200 -dmenu -p "Power"`

# Case switch

case $option in
    'Lock Screen')
        ~/bin/lock.sh
        ;;
    'Log Out')
        i3-msg exit
        ;;
    'Reboot')
        reboot
        ;;
    'Power Off')
        shutdown -h now
        ;;
esac
