#!/bin/sh

export LOGFILE=~/bin/backup/backup-log_`date "+%d-%m-%Y-%H%M"`.log


export BACKUP_TARGET="/Volumes/FileBackup"
~/bin/backup/sync_data.sh
~/bin/backup/sync_itunes.sh
~/bin/backup/sync_itunes_media.sh
~/bin/backup/sync_movies.sh
~/bin/backup/sync_pictures.sh

export BACKUP_TARGET="/Volumes/FileBackup 2"
~/bin/backup/sync_data.sh
~/bin/backup/sync_itunes.sh
~/bin/backup/sync_itunes_media.sh
~/bin/backup/sync_movies.sh
~/bin/backup/sync_pictures.sh
