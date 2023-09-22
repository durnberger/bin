#!/bin/bash

# Used by the i3 window manager and called from '.config/i3/config'
#

# -------------------------------------------------------------------------------------
# Version 1 - choose a wallpaper for the lock screen
# The background image *must* be a '.png'
#
#i3lock --nofork --image ~/wallpaper/avro-vulcan.png --ignore-empty-password --show-failed-attempts

# -------------------------------------------------------------------------------------
# Version 2 - take a screenshot, blur it, and set that as the wallpaper 
# Source: https://github.com/leonmutschke/i3lock-config/blob/master/my-i3lock-config.sh
#
# Variables
PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"
BLUR="5x4"

# Process
$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
i3lock -i $PICTURE
rm $PICTURE

# -------------------------------------------------------------------------------------
