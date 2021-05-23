#!/usr/bin/env bash

regist_basic_cat() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/cat"

    m["basic_cat_display_eol"]="${c}/display_eol.sh"
    m["basic_cat_display_tabchar"]="${c}/display_tabchar.sh"
    m["basic_cat_omit_emtpy_lines"]="${c}/omit_empty_lines.sh"
    m["basic_cat_with_number"]="${c}/with_number.sh"
}