#!/bin/sh
echo "====================================================="
echo "Starting Backup of 'iTunes Media' to $BACKUP_TARGET"
rsync -a --delete --delete-excluded --cvs-exclude $@ \
    --exclude-from=$HOME/bin/backup/rsync-std-excludes \
    "/Volumes/Music/iTunes Media/" \
    "$BACKUP_TARGET/music/iTunes Media/" >> $LOGFILE 2>&1
