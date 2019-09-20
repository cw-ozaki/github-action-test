#!/bin/sh

cd "${MOD_ACTION_WORKING_DIR:-.}"

git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --global user.name "${GITHUB_ACTOR}"

echo "#########################################"

git config --global http.https://github.com/cw-ozaki/github-action-test.extraheader "AUTHORIZATION: bearer ${GITHUB_TOKEN}"

echo "#########################################"

git config --get-regexp '.*'

echo "#########################################"

ls -la /github/home
cat /github/home/.gitconfig

echo "#########################################"

exec mod up "$@"
