#!/bin/sh

DROPLET=${1:-dev}
SNAPSHOTNAME="$DROPLET-`date +%Y%m%d`"

pontoon droplet shutdown $DROPLET
echo "sleeping for 30s" && sleep 30
pontoon droplet poweroff $DROPLET --yes
echo "sleeping for 15s" && sleep 15
pontoon droplet snapshot $DROPLET $SNAPSHOTNAME
echo "sleeping for 6min" && sleep 360
pontoon droplet destroy $DROPLET
echo "sleeping for 1min" && sleep 60
echo "\nDestroy finished! Check that '$DROPLET' is not active anymore!\n"
pontoon droplet list
