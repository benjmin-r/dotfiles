#!/bin/sh
if [ ! -e /.000 ]; then
    mkdir -m0777 /.000
fi
/usr/bin/hdiutil attach -mountpoint /.000 -nobrowse /Users/Shared/steam.sparseimage
