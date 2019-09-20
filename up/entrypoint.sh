#!/bin/sh

cd "${MOD_ACTION_WORKING_DIR:-.}"

git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --global user.name "${GITHUB_ACTOR}"

echo "#########################################"

git config --get-regexp '.*'

echo "#########################################"

git config --get-all http.https://github.com/cw-ozaki/github-action-test.extraheader
git config --get-all http.proxy

echo "#########################################"

exec mod up "$@"
