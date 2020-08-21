#!/bin/bash

WD="/mnt/hdd0/"
SOURCE="backups"
FILENAME="arch-backups.tar.gz"
DEST="remote:Backups"
LOG="/var/log/cron-onedrive-backup.log"
 
cd $WD
date > $LOG
tar cf - $SOURCE | pigz > $FILENAME 2>> $LOG
rclone copy $FILENAME $DEST 2>> $LOG
rm $FILENAME
