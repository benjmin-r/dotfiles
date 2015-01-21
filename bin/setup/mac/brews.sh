#!/bin/bash

readonly PROGNAME=$(basename $0)
readonly PROGDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly ARGS="$@"

function bi {
    local app_name=$1
    local installed=$(brew ls --versions $app_name)

    if [[ -z $installed ]]; then
        brew install $app_name
    else
        echo "--> App '$app_name' already installed. Doing nothing!"
    fi
}

function init {
    brew tap homebrew/dupes
    brew tap nureineide/devel
}

function main {
    brew install mutt-1.5.21 --with-s-lang --with-sidebar-patch
    bi ack
    bi automake
    bi bash
    bi bash-completion
    bi contacts
    bi cowsay
    bi ctags
    bi exiftool
    bi git
    bi grep
    bi htop-osx
    bi ifstat
    bi iftop
    bi md5sha1sum
    bi mobile-shell
    bi msmtp
    bi notmuch
    bi offline-imap
    bi openssh
    bi openssl
    bi pwgen
    bi readline
    bi reattach-to-user-namespace
    bi rsync
    bi sqlite
    bi tig
    bi tmux
    bi tmux-mem-cpu-load
    bi urlview
    bi vim
    bi macvim
    bi weechat
    bi wget
}


if [ -z "$ARGS" ]; then
    echo "doing nothing"
else
    init
    main $ARGS
fi

