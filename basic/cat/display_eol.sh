#!/usr/bin/env bash

#
# cat コマンドのちょっとした Tips (EOL(End Of Line)を表示)
#
# REFERENCES:
#   - https://linuxhint.com/cat-command-linux/
#
_exec() {
    # 作業用ディレクトリ作成
    basedirpath=/tmp/try-linux/cat/display_eol
    rm -rf "${basedirpath}"
    mkdir -p "${basedirpath}"

    printf "hello\tworld\nworld\thello\n\nhello,world\n" > "${basedirpath}/hello.txt"

    # -e オプションを付与すると行末が $ として可視化される
    cat -e "${basedirpath}/hello.txt"
}

_exec