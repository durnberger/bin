#!/bin/bash
#

# Created by Paul Durnberger 2022-07-18
#

# "To run this script periodically, add a line to crontab with the command"
#	'crontab -e'
#
# "In the following example, the script will run at 53 minutes past every hour"
#  '53 * * * * ~/bin/backup-home.sh'
#
# "In this next example, the script will run every day at 5:31pm"
#  '31 17 * * * ~/bin/backup-home.sh'
#

# Switches
# a = archive mode = syncs directories recursively, transfer special and block devices and preserve symbolic links, modification times, group, ownership, and permissions
# v = increase verbosity
# x = don't cross file system boundaries
#
rsync -avx --delete --exclude-from='/home/paul/bin/backup-home/excludes_from_server.txt' ~/ /media/server/warehouse/.pavillion_backup/
