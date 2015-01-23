function view_markdown() {
    /Applications/Marked.app/Contents/MacOS/Marked $1 &
}

function ssh_tail() {
    ssh $1 "tail -f /var/log/upstart/${2}.log"
}

function pgr() {
    ps -xeo pid,command | grep -i $1 | grep -v grep
}

function pgrid() {
    pgr $1 | awk '{print $1}'
}

function pgrkill() {
    pgrid $1 | xargs kill
}

function copy-file-content() {
    cat $1 | pbcopy
}

function m() {
    cd ~/Downloads && mutt -n -e "source ~/.mutt/accounts/$1"
}

function upgrade() {
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

# The following is ripped off from Chris and the original is at
# https://github.com/chr4/shellrc/blob/master/rc.d/functions.sh#L31-L60
# Recursively traverse directory tree for git repositories, run git command
# e.g.
#   gittree status
#   gittree diff
gittree() {
  if [ $# -lt 1 ]; then
    echo "Usage: gittree <command>"
    return 1
  fi

  for gitdir in $(find . -type d -name .git); do
    # Display repository name in blue
    repo=$(dirname $gitdir)
    echo -e "\033[34m$repo\033[0m"

    # Run git command in the repositories directory
    cd $repo && git $@
    ret=$?

    # Return to calling directory (ignore output)
    cd - > /dev/null

    # Abort if cd or git command fails
    if [ $ret -ne 0 ]; then
      return 1
    fi

    echo
  done
}

