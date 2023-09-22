#!/bin/bash

# A small script to connect bluetooth devices at start up.
#
# The MAC address for each device is required.
#
# Find bluetooth devices and their MAC addresses using the command 
#   
#       'bluetoothctl devices'
#
# The device will only be connected if the device is trusted. To add a device to the
# trusted list, use the command 
#
#       'bluetoothctl trust [MAC address]'
#

bluetoothctl

# Yamaha YBA-11
sleep 15
echo "connect 00:A0:DE:06:5B:76" | bluetoothctl
exit
