#!/bin/sh

DROPLET=${1:-dev}
SNAPSHOT=`pontoon snapshot list | tail -n +2 | sort | tail -n 1 | sed "s/ - //"`
pontoon droplet create $DROPLET --image=$SNAPSHOT

echo "ssh -o 'UserKnownHostsFile /dev/null' -o 'StrictHostKeyChecking no' " \
    " -L 9000:127.0.0.1:9000 -L 8000:127.0.0.1:8000 " \
    "`pontoon droplet field $DROPLET ip_address`" \
    | pbcopy

echo "Droplet started! IP address is in clipboard"
