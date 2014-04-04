#!/bin/sh
echo "====================================================="
echo "Starting Backup of 'movies' to $BACKUP_TARGET"
rsync -a --delete --delete-excluded --cvs-exclude $@ \
    --exclude-from=$HOME/bin/backup/rsync-std-excludes \
    "/Volumes/Filme/" \
    "$BACKUP_TARGET/Filme/" >> $LOGFILE 2>&1
