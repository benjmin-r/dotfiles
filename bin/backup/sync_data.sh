#!/bin/sh
echo "====================================================="
echo "Starting Backup of 'data' to $BACKUP_TARGET"
rsync -a --delete --delete-excluded --cvs-exclude $@ \
    --exclude-from=$HOME/bin/backup/rsync-std-excludes \
    "/Users/benjamin/data/" \
    "$BACKUP_TARGET/data/" >> $LOGFILE 2>&1
