#!/bin/sh

cd "${MOD_ACTION_WORKING_DIR:-.}"

exec mod up "$@"
