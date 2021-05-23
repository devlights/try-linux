#!/usr/bin/env bash

regist_basic_proc() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/proc"

    m["basic_proc_list_proc_environ"]="${c}/list_proc_environ.sh"
}