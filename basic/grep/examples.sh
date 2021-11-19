#!/usr/bin/env bash

regist_basic_grep() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/grep"

    m["basic_grep_remove_empty_lines"]="${c}/grep_remove_emptyline.sh"
    m["basic_grep_only_matching"]="${c}/grep_only_matching.sh"
}