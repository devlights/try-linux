#!/usr/bin/env bash

regist_basic_find() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/find"

    m["basic_find_regex"]="${c}/find_regex.sh"
}