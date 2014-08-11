#!/bin/bash

readonly TIMESTAMP=`date "+%d-%m-%Y-%H%M"`
readonly LOGFILE="$HOME/bin/backup/full-backup-log_${TIMESTAMP}.log"
readonly SHASUMS_FILE="$HOME/bin/backup/shasums_fullbackup_${TIMESTAMP}.txt"
readonly SHASUMS_CHECK_FILE="$HOME/bin/backup/shasums_fullbackup_${TIMESTAMP}_check.txt"

backup() {
    local source=$1
    local target=$2

    echo "Backing up '$source' to '$target'"
    sudo rsync -cvaxAX --delete --ignore-errors --delete-excluded --cvs-exclude \
        --exclude-from="$HOME/bin/backup/rsync-std-excludes" \
        "$source" \
        "$target" >> "$LOGFILE" 2>&1
}

check_file_checksums() {
    local source=$1
    local target=$2

    echo "Comparing files in '$source' and '$target'"
    pushd $source
    find . -type f -a ! -name ".DS_Store" -exec  shasum '{}' \; > $SHASUMS_FILE

    pushd $target
    shasum -c < $SHASUMS_FILE > $SHASUMS_CHECK_FILE

    cat $SHASUMS_CHECK_FILE| fgrep -v OK

    popd && popd
}

main() {
    # be sure to end source dirs with slash
    backup "/Users/benjamin/" "/Volumes/FullBackup/benjamin/"
    backup "/Volumes/Music/" "/Volumes/FullBackup/music/"
    backup "/Volumes/Filme/" "/Volumes/FullBackup/movies/"
}

main
