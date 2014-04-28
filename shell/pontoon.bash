pocreate() {
    workon pontoon
    DROPLET=${1:-dev}
    SNAPSHOT=`pontoon snapshot list | tail -n +2 | sort | tail -n 1 | sed "s/ - //"`
    pontoon droplet create $DROPLET --image=$SNAPSHOT
    echo "ssh `pontoon droplet field $DROPLET ip_address`" | pbcopy
    echo "Droplet started! IP address is in clipboard"
}

podestroy() {
    workon pontoon
    DROPLET=${1:-dev}
    pontoon droplet poweroff $DROPLET
    pontoon droplet destroy $DROPLET
}
