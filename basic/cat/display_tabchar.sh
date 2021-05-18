#!/usr/bin/env bash

#
# cat コマンドのちょっとした Tips (タブを表示)
#
# REFERENCES:
#   - https://linuxhint.com/cat-command-linux/
#
_exec() {
    # 作業用ディレクトリ作成
    basedirpath=/tmp/try-linux/cat/display_tabchar
    rm -rf "${basedirpath}"
    mkdir -p "${basedirpath}"

    printf "hello\tworld\nworld\thello\n\nhello,world\n" > "${basedirpath}/hello.txt"

    # -T オプションを付与するとタブ文字が ^I として可視化される
    cat -T "${basedirpath}/hello.txt"
}

_exec