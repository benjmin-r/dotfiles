#!/bin/sh
for app in $(brew outdated | cut -f 1); do brew upgrade ${app}; done
