#!/bin/sh
echo "====================================================="
echo "Starting Backup of 'Pictures' to $BACKUP_TARGET"
rsync -a --delete --delete-excluded --cvs-exclude $@ \
    --exclude-from=$HOME/bin/backup/rsync-std-excludes \
    "/Users/benjamin/Pictures/Pictures/" \
    "$BACKUP_TARGET/Pictures/" >> $LOGFILE 2>&1
