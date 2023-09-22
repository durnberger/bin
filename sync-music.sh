#!/bin/bash

echo "Sync the server music directory with an SD card"
echo

# Is the server on and the memory card in place?
echo "Is the server on and the SD card in place?"
echo "1) Yes"
echo "2) No "
echo
read choice

if [ "$choice" == "1" ]; then
	# Select the appropriate memory card
	echo
	echo "Run 'lsblk'. Where is the sdcard (/dev/sxxx)?"
	echo
	lsblk
	echo

	echo -n "Type in the location in the form 'sXXX': "
	read mountpoint
	echo

	# Mount the memory card
	echo "Mount /dev/$mountpoint at /media/sdcard"
	sudo mount /dev/$mountpoint /media/sdcard -o defaults,uid=paul,gid=users,umask=0002
	echo

	echo "Check the contents of /dev/$mountpoint"
	cd /media/sdcard
	ls -al
	echo

	# Right device?
	echo "Do we have the right device?"
	echo "1) Yes "
	echo "2) No "
	read choice

		if [ "$choice" == "1" ]; then
			# Mount the server shares
			echo "Mount the server shares..."
			bash ~/bin/mount-server.sh
			echo

			# Choose either FLAC or MP3	
			echo "Are you copying FLAC or MP3 files?"
			echo "1) FLAC"
			echo "2) MP3"
			read choice

				if [ "$choice" == "1" ]; then
					# FLAC Files
					echo  "Syncing FLAC files..."
					rsync -avx --delete /media/server/music/flac/ /media/sdcard
					echo
					echo "Sync Complete"
					echo

					echo "Unmount /media/sdcard.."
					sudo umount /media/sdcard
					echo
					sleep 5

					echo "Finished. It is safe to remove the SDCard"
					echo

				elif [ "$choice" == "2" ]; then
					# MP3 files
					echo  "Syncing MP3 files..."
					rsync -avx --delete /media/server/music/mp3/ /media/sdcard
					echo
					echo "Sync Complete"
					echo
					sleep 5

					echo "Unmount /media/sdcard.."
					sudo umount /media/sdcard
					echo

					echo "Finished. It is safe to remove the SDCard"
					echo

				else
					# Neither FLAC or MP3 was chosen
					echo
					echo "Incorrect selection. Script terminated."
					echo

				fi

		else
			# We do not have the right device, start again
			echo
			echo "Script terminated"
			echo
		fi

else
# Either the server is not on or the memory card is not in place
echo "Prepare the hardware, and run this script again"
echo

fi
