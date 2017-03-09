function count_filesize() {
    find $1 -name "*.$2" -ls | awk '{total += $7} END {print total}'
}

function view_markdown() {
    /Applications/Marked.app/Contents/MacOS/Marked $1 &
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

function gpg-launch() {
    pgrkill gpg && gpg-agent --daemon | pbcopy
    echo "GPG-Agent launched, env info in clipboard"
}

function m() {
    local accountname=$1
    shift
    cd ~/Downloads && mutt -n -e "source ~/.mutt/accounts/$accountname" $@
}

function json-prettyprint() {
    cat $1 | python -m json.tool
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

