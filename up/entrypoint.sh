#!/bin/sh

cd "${MOD_ACTION_WORKING_DIR:-.}"

echo "## user: ${GITHUB_ACTOR}@users.noreply.github.com"

git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --global user.name "${GITHUB_ACTOR}"
env

exec mod up "$@"
