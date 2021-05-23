#!/usr/bin/env bash

regist_basic_ls() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/ls"

    m["basic_ls_orderby_desc"]="${c}/ls_orderby_desc.sh"
}