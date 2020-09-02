#!/bin/bash

# commit changes in personal maildir to git
pushd ~/.mail/personal
git add --all && git commit -m "Update at ${date}"
popd
