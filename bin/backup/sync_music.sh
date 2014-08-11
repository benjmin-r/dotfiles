#!/bin/sh
echo "====================================================="
echo "Starting Backup of 'iTunes' to $BACKUP_TARGET"
rsync -a --delete --delete-excluded --cvs-exclude $@ \
    --exclude-from=$HOME/bin/backup/rsync-std-excludes \
    "/Volumes/Music/" \
    "$BACKUP_TARGET/music/" >> $LOGFILE 2>&1
