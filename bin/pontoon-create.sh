#!/bin/sh

DROPLET=${1:-dev}
SNAPSHOT=`pontoon snapshot list | tail -n +2 | sort | tail -n 1 | sed "s/ - //"`
pontoon droplet create $DROPLET --image=$SNAPSHOT

DROPLET_IP_ADDR=`pontoon droplet field $DROPLET ip_address`
SSH_BASE_ARGS="ssh -A -o 'UserKnownHostsFile /dev/null' -o 'StrictHostKeyChecking no'"
SSH_FORWARDS_ARGS="-L 9000:127.0.0.1:9000 -L 8000:127.0.0.1:8000"

echo "$SSH_BASE_ARGS $SSH_FORWARDS_ARGS $DROPLET_IP_ADDR" | pbcopy
echo "mosh --ssh=\"$SSH_BASE_ARGS\" $DROPLET_IP_ADDR" | pbcopy

echo "Droplet started! IP address is in clipboard"
