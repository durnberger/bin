#!/bin/bash
#

# ~/bin/server-status.sh
#
if ping -c1 -W5 192.168.0.6 | grep -q "0 received"; then

  echo "offline"

  exit 33

else

  if findmnt | grep /media/server > /dev/null; then

    # Server shares have been mounted
	  echo "🌑"
	  echo "🌑"

    exit 0

  else

    # Server shares available but not mounted
    echo "🌕"
    echo "🌕"
    echo \#ff0000 # red

  fi

fi
