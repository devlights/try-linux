#!/usr/bin/env bash

regist_basic_newline() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/newline"

    m["basic_newline_remove_carriage_return_with_col"]="${c}/remove_carriage_return_with_col.sh"
}