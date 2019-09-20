#!/bin/sh

cd "${MOD_ACTION_WORKING_DIR:-.}"

echo "## user: ${GITHUB_ACTOR}@users.noreply.github.com"

git config --global user.email "ozaki@@chatwork.com"
git config --global user.name "cw-ozaki"

exec mod up "$@"
