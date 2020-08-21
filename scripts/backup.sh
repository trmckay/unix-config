#!/bin/bash

# NOTE!!!
# cannot use home folder variables since this will usually
# be executed as root

LOG="/var/log/cron-backup.log"
TARG1="/home"
TARG2="/etc"
PKGLIST="/home/trevor/.packages"
DEST="/mnt/hdd0/backups/daily"

date > $LOG

echo "Rotating backups..." >> $LOG
rsync -a --quiet --delete $DEST/* $DEST.old >> $LOG

echo "Syncing $TARG1..." >> $LOG
rsync -a --quiet --delete /home $DEST >> $LOG
echo "Syncing $TARG2..." >> $LOG
rsync -a --quiet --delete /etc $DEST >> $LOG
echo "Copying package list" >> $LOG
cp -r /home/trevor/.packages $DEST/packages >> $LOG

echo "Backup complete!" >> $LOG
