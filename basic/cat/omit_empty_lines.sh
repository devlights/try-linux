#!/usr/bin/env bash

#
# cat コマンドのちょっとした Tips (重複する空行を除去)
#
# REFERENCES:
#   - https://linuxhint.com/cat-command-linux/
#
_exec() {
    # 作業用ディレクトリ作成
    basedirpath=/tmp/try-linux/cat/omit_empty_line
    rm -rf "${basedirpath}"
    mkdir -p "${basedirpath}"

    cat << EOF > "${basedirpath}/app.go"
package main
func main() {




    println("hello Golang")





}
EOF

    # -s オプションをつけると重複している空行を除去してくれる
    # つまり、連続する空行を一行にしてくれる
    cat -s "${basedirpath}/app.go"
}

_exec