#!/usr/bin/env bash

regist_basic_zerobinary() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/zerobinary"

    m["basic_zerobinary_using_dd"]="${c}/zerbinary_dd.sh"
    m["basic_zerobinary_using_head"]="${c}/zerobinary_head.sh"
}