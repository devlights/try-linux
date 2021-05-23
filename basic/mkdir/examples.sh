#!/usr/bin/env bash

regist_basic_mkdir() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/mkdir"

    m["basic_mkdir_multiple_dirs_at_once"]="${c}/multiple_dirs_once.sh"
}
