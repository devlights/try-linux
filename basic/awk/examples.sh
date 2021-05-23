#!/usr/bin/env bash

regist_basic_awk() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/awk"

    m["basic_awk_01"]="${c}/awk01.sh"
    m["basic_awk_02"]="${c}/awk02.sh"
    m["basic_awk_skip_first_line"]="${c}/skip_first_line.sh"    
}