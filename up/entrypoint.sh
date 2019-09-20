#!/bin/sh

cd "${MOD_ACTION_WORKING_DIR:-.}"

git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --global user.name "${GITHUB_ACTOR}"

echo "#########################################"

git config --global http.extraheader "AUTHORIZATION: basic ${GITHUB_TOKEN}"

echo "#########################################"

git config --get-regexp '.*'

echo "#########################################"

git pull origin master

echo "#########################################"

exec mod up "$@"
