#!/bin/bash
#

# Is NordVPN connected?
#
if nordvpn status | grep -q "Connected";


# If NordVPN is connected
#
then

  STATUS=$(nordvpn status | grep Country | xargs echo)

  # Full & short text
  echo "$STATUS"
  echo "$STATUS"

  # Set text to red if the country status is not the UK
  [ "${STATUS}" != "Country: United Kingdom" ] && echo "#ff0000"

  exit 0

# If NordVPN is not connected
#
else

  # Full & short text
  echo "is DISCONNECTED"
  echo "is DISCONNECTED"

  # Exit with warning (white text on red)
  exit 33

fi
