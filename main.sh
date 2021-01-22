#!/usr/bin/env bash

declare -A mappings

_make_mappings() {
    mappings=(
        ["ls_orderby_desc"]="basic/ls/ls_orderby_desc.sh"
        
        ["awk_01"]="basic/awk/awk01.sh"
        ["awk_02"]="basic/awk/awk02.sh"
        ["awk_skip_first_line"]="basic/awk/skip_first_line.sh"
        
        ["mkdir_multiple_dirs"]="basic/mkdir/multiple_dirs_once.sh"
        
        ["col_remove_cr"]="basic/col/remove_carriage_return.sh"
        
        ["proc_list_proc_environ"]="basic/proc/list_proc_environ.sh"

        ["convert_hex_to_bin"]="basic/convert/hex_to_bin.sh"
        ["convert_bin_to_hex"]="basic/convert/bin_to_hex.sh"
        ["convert_bin_to_dec"]="basic/convert/bin_to_dec.sh"
        ["convert_hex_to_dec"]="basic/convert/hex_to_dec.sh"

        ["bash_heredoc"]="basic/bashtips/heredoc/heredoc.sh"
        ["bash_arithmetic_expansion"]="basic/bashtips/arithmetic_expansion/arithmetic_expansion.sh"

        ["zerobinary_head"]="basic/zerobinary/zerobinary_head.sh"
        ["zerobinary_dd"]="basic/zerobinary/zerobinary_dd.sh"

        ["find_regex"]="basic/find/find_regex.sh"
    )
}

# main function
#
# REFERENCES::
#   - https://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash
#   - https://qiita.com/kaw/items/034bc4221c4526fe8866
#   - https://eng-entrance.com/linux-shellscript-keyboard
#   - https://eng-entrance.com/linux-shellscript-function
#   - https://qiita.com/b4b4r07/items/e56a8e3471fb45df2f59
#   - https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash
#   - https://qiita.com/b4b4r07/items/cb02bbfd6df58df06ea8
#   - https://www.atmarkit.co.jp/ait/articles/1905/30/news017.html
_main() {
    onetime=false
    while getopts o option
    do
        case "$option" in
            o)
                onetime=true;;
            \?)
                echo "Usage: $0 [-o]" 1>&2
                exit 1;;
        esac
    done

    while :
    do
        echo -n 'ENTER EXAMPLE NAME: '
        read -r name

        case "$name" in
            quit)
                break;;
            list)
                for key in "${!mappings[@]}"
                do 
                    echo "$key"; 
                done

                continue;;
            help)
                echo 'list -- show example names'
                echo 'quit -- quit application'
                continue;;
        esac

        # Find candidates
        declare -a candidates=()
        count=0
        for key in "${!mappings[@]}"
        do 
            if [[ "$key" == *"$name"* ]]; then
                candidates=("${candidates[@]}" "$key")
                (( count++ ))
            fi
        done

        if [ "$count" -eq 0 ]; then
            echo -e '\nNo candidates were found...Please try again.\n'
            continue;
        fi

        if [ "$count" -gt 1 ]; then
            echo -e '\nMultiple candidates were found...'
            echo '-----------------------------------'

            for ((i=0; i < ${#candidates[@]}; i++)) {
                echo "${candidates[i]}"
            }

            echo -e '-----------------------------------\n'
            continue;
        fi

        # There is only one candidate, execute it.
        target="${candidates[0]}"
        script_path="${mappings[${target}]}"

        echo ''
        echo "[INPUT ] ${name}"
        echo "[TARGET] ${target}"
        echo "[SCRIPT] ${script_path}"
        echo ''

        echo "===== START [${script_path}] ====="
        (
            $(command -v env) bash "${script_path}"
        )
        echo "===== END   [${script_path}] ====="

        if [ "$onetime" ]
        then
            break
        fi
    done

    echo ''
    echo 'DONE'
}

_make_mappings
_main
