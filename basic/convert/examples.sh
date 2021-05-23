#!/usr/bin/env bash

regist_basic_convert() {
    declare -n m=$1
    export m

    local c
    c="$(pwd)/basic/convert"

    m["basic_convert_bin2dec"]="${c}/bin_to_dec.sh"
    m["basic_convert_bin2hex"]="${c}/bin_to_hex.sh"
    m["basic_convert_hex2bin"]="${c}/hex_to_bin.sh"
    m["basic_convert_hex2dec"]="${c}/hex_to_dec.sh"
}