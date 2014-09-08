#!/bin/sh

DROPLET=${1:-dev}
SHOULD_SNAPSHOT=${2:-1}
SNAPSHOTNAME="$DROPLET-`date +%Y%m%d`"

pontoon droplet shutdown $DROPLET
echo "SHUT DOWN ... sleeping for 30s" && sleep 30
pontoon droplet poweroff $DROPLET --yes
echo "POWERED OFF ... sleeping for 15s" && sleep 15
if [ "$SHOULD_SNAPSHOT" -eq 1 ]; then
    pontoon droplet snapshot $DROPLET $SNAPSHOTNAME
    echo "SNAPSHOTTING ... sleeping for 10min" && sleep 600
fi
pontoon droplet destroy $DROPLET
echo "DESTROYING ... sleeping for 1min" && sleep 60
echo "\nDestroy finished! Check that '$DROPLET' is not active anymore!\n"
pontoon droplet list
