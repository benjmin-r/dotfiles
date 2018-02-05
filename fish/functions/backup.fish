function backup -d "use rsync to copy from SOURCE_DIR to TARGET_DIR"
    set source_dir $argv[1]
    set target_dir $argv[2]
    set --erase argv[1]
    set --erase argv[2]
    echo "Backing up '$source_dir' to '$target_dir'"
    sudo rsync -caxAX --info=progress2 --delete --ignore-errors --delete-excluded \
        --exclude-from="$HOME/bin/backup/rsync-std-excludes" \
        "$source_dir" \
        "$target_dir"

end

