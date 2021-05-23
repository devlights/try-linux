#!/usr/bin/env bash

regist_basic_split() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/split"

    m["basic_split_using_dd"]="${c}/using_dd.sh"
}