#!/bin/bash
#

if ping -c1 -W5 192.168.0.6 | grep -q "0 received"; then

    # Full & short text
    echo "Offline"
    echo "Offline"

    exit 33

  else

    if findmnt | grep /media/server > /dev/null; then

      echo "Online"
      echo

      exit 0

    else

      # Documents
      # =========
      sudo mount -t cifs -o credentials=~/.smbcredentials,user=paul,uid=1000,gid=100,dir_mode=0755,file_mode=0755 //192.168.0.6/documents /media/server/documents

      # Music
      # =====
      #sudo mount -t cifs -o credentials=~/.smbcredentials,user=paul,uid=1000,gid=100,dir_mode=0755,file_mode=0755 //192.168.0.6/music /media/server/music

      # Warehouse
      # =========
      sudo mount -t cifs -o credentials=~/.smbcredentials,user=paul,uid=1000,gid=100,dir_mode=0755,file_mode=0755 //192.168.0.6/warehouse /media/server/warehouse

      # Backups
      # =======
      sudo mount -t cifs -o credentials=~/.smbcredentials,user=paul,uid=1000,gid=100,dir_mode=0755,file_mode=0755 //192.168.0.6/backups /media/server/backups


      # Confirmation
      # ============
      if findmnt | grep documents > /dev/null; then
        echo "Documents mounted"
        notify-send "Documents mounted"

      else
        echo "Documents failed to mount"
        notify-send "Documents failed to mount"
      fi

      if findmnt | grep warehouse > /dev/null; then
        echo "Warehouse mounted"
        notify-send "Warehouse mounted"
      else
        echo "Warehouse failed to mount"
        notify-send "Warehouse failed to mount"
      fi

      if findmnt | grep backups > /dev/null; then
        echo "Backups mounted"
        notify-send "Backups mounted"
      else
        echo "Backups failed to mount"
        notify-send "Backups failed to mount"
      fi

      exit 0

    fi

fi
