#!/bin/bash

# NOTE!!!
# cannot use home folder variables since this will usually
# be executed as root

date > /var/log/cron-backup.log

echo "Backing up to HDD..." >> /var/log/cron-backup.log
rsync -a --quiet --delete /home /mnt/hdd0/backups >> /var/log/cron-backup.log
rsync -a --quiet --delete /etc /mnt/hdd0/backups >> /var/log/cron-backup.log
cp -r /home/trevor/.packages /mnt/hdd0/backups/packages >> /var/log/cron-backup.log

if mount | grep /mnt/usb-s0 > /dev/null; then
    echo "Backing up to USB media..." >> /var/log/cron-backup.log
    rsync -a --quiet --delete /home /mnt/usb-s0/backups >> /var/log/cron-backup.log
    rsync -a --quiet --delete /etc /mnt/usb-s0/backups >> /var/log/cron-backup.log
    cp -r /home/trevor/.packages /mnt/usb-s0/backups/packages >> /var/log/cron-backup.log
fi

echo "Backup complete!" >> /var/log/cron-backup.log
