#!/bin/sh
BRANCH_NAME=$1
git config --unset branch.$BRANCH_NAME.remote
git config --unset branch.$BRANCH_NAME.merge
git branch -d -r origin/$BRANCH_NAME

