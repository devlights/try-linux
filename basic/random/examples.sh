#!/usr/bin/env bash

regist_basic_random() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/random"

    m["basic_random_using_shuf"]="${c}/using_shuf.sh"
}