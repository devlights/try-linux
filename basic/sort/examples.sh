#!/usr/bin/env bash

regist_basic_sort() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/sort"

    m["basic_sort_numeric_sort"]="${c}/numeric_sort.sh"
}