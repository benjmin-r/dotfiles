#!/bin/sh

git log --reverse \
        --author="`git config user.name`" \
        --since="2 week ago" \
        --pretty=format:"[%s](https://github.com/`git config remote.origin.url | sed -e "s/.*:\(.*\).git/\1/g"`/commit/%H)" 
