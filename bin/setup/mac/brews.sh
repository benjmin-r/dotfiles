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
}

function main {
    bi mutt
    bi ack
    bi automake
    bi bash
    bi contacts
    bi ctags
    bi exiftool
    bi git
    bi grep
    bi ifstat
    bi iftop
    bi md5sha1sum
    #bi mobile-shell
    #bi msmtp
    #bi notmuch
    bi offline-imap
    bi openssh
    bi openssl
    bi pwgen
    bi readline
    bi reattach-to-user-namespace
    bi rsync
    bi sqlite
    bi tmux
    bi tmux-mem-cpu-load
    bi urlview
    bi neovim
    bi macvim
    bi wget
    bi vdirsyncer
}


if [ -z "$ARGS" ]; then
    echo "doing nothing"
else
    init
    main $ARGS
fi


