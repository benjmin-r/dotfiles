
function pgr() {
    ps -xeo pid,command | grep -i $1 | grep -v grep
}

function pgrid() {
    pgr $1 | awk '{print $1}'
}

function pgrkill() {
    pgrid $1 | xargs kill
}

upgrade() {
    local retry=5 count=0

    # retry at most $retry times, waiting 1 minute between each try
    while true; do

        # Tell apt-get to only download packages for upgrade, and send 
        # signal 15 (SIGTERM) if it takes more than 10 minutes
        if timeout -15 600 apt-get --assume-yes --download-only upgrade; then
            break
        fi
        if (( count++ == retry )); then
            printf 'Upgrade failed\n' >&2
            return 1
        fi
        sleep 60
    done

    # At this point there should be no more packages to download, so 
    # install them.
    apt-get --assume-yes upgrade
}

function pless {
  pygmentize $1 | less -r
}
