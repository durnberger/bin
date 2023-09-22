#!/bin/bash
#
# Used to keep the NordVPN connection alive.
#
# Add the following line using 'crontab -e', and this script will run at 35 minutes passed every hour.
#
# '35 * * * * ~/bin/nordvpn-connect.sh'
#
# ----------------------------------------------------------------------------------------------------
#
# As of early 2022, and since being upgraded, NordVPN is no longer activating the killswitch when the
# computer goes to sleep, and so we have not had used 'crontab' scheduling to keep the vpn alive.
#
# ----------------------------------------------------------------------------------------------------
#

#function timestamp {
#    TEXT="Date:"
#    DATE=`date +%Y-%m-%d`
#    TIME=`date +%H:%M:%S`
#    ZONE=`date +"%Z %z"`
#echo $TEXT $DATE $TIME $ZONE
#}

echo -e " =============== "
echo -e " NORDVPN CONNECT "
echo -e " =============== "
echo -e

#echo -e " Disconnect "
#echo -e " ---------- "
#nordvpn disconnect
#echo

echo -e " Connect "
echo -e " ------- "
nordvpn connect United_Kingdom
echo

echo -e " Settings "
echo -e " -------- "
nordvpn settings
echo

echo -e " NordVPN Status "
echo -e " -------------- "
nordvpn status
echo
echo

#timestamp
#echo
