#!/bin/sh

DROPLET=${1:-dev}
SNAPSHOTNAME="$DROPLET-`date +%Y%m%d`"

pontoon droplet shutdown $DROPLET
echo "sleeping for 30s" && sleep 30
pontoon droplet poweroff $DROPLET
echo "sleeping for 15s" && sleep 15
pontoon droplet snapshot $DROPLET $SNAPSHOTNAME
echo "sleeping for 5min" && sleep 300
pontoon droplet destroy $DROPLET
