#!/bin/sh

DROPLET=${1:-dev}
SNAPSHOTNAME="$DROPLET-`date +%Y%m%d`"

workon pontoon

pontoon droplet shutdown $DROPLET
sleep 5
pontoon droplet poweroff $DROPLET
sleep 5
pontoon droplet snapshot $DROPLET $SNAPSHOTNAME
sleep 10
pontoon droplet destroy $DROPLET
