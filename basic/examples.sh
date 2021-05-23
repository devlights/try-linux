#!/usr/bin/env bash

regist_basic() {
    declare -n m=$1
    export m

    local curdir
    local regsh
    curdir="$(pwd)/basic"
    regsh="examples.sh"

    # shellcheck source=/dev/null
    . "${curdir}/awk/${regsh}"
    regist_basic_awk "$1"

    # shellcheck source=/dev/null
    . "${curdir}/cat/${regsh}"
    regist_basic_cat "$1"

    # shellcheck source=/dev/null
    . "${curdir}/convert/${regsh}"
    regist_basic_convert "$1"

    # shellcheck source=/dev/null
    . "${curdir}/find/${regsh}"
    regist_basic_find "$1"

    # shellcheck source=/dev/null
    . "${curdir}/grep/${regsh}"
    regist_basic_grep "$1"

    # shellcheck source=/dev/null
    . "${curdir}/kernelversion/${regsh}"
    regist_basic_kernelversion "$1"

    # shellcheck source=/dev/null
    . "${curdir}/ls/${regsh}"
    regist_basic_ls "$1"

    # shellcheck source=/dev/null
    . "${curdir}/mkdir/${regsh}"
    regist_basic_mkdir "$1"

    # shellcheck source=/dev/null
    . "${curdir}/newline/${regsh}"
    regist_basic_newline "$1"

    # shellcheck source=/dev/null
    . "${curdir}/proc/${regsh}"
    regist_basic_proc "$1"

    # shellcheck source=/dev/null
    . "${curdir}/random/${regsh}"
    regist_basic_random "$1"

    # shellcheck source=/dev/null
    . "${curdir}/sort/${regsh}"
    regist_basic_sort "$1"

    # shellcheck source=/dev/null
    . "${curdir}/split/${regsh}"
    regist_basic_split "$1"

    # shellcheck source=/dev/null
    . "${curdir}/zerobinary/${regsh}"
    regist_basic_zerobinary "$1"
}