#!/usr/bin/env bash

regist_basic_kernelversion() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/kernelversion"

    m["basic_kernelversion_kernelvesion"]="${c}/kernelversion.sh"
}