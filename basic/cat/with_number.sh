#!/usr/bin/env bash

#
# cat コマンドのちょっとした Tips (行番号を付与)
#
# REFERENCES:
#   - https://linuxhint.com/cat-command-linux/
#
_exec() {
    # 作業用ディレクトリ作成
    basedirpath=/tmp/try-linux/cat/with_number
    rm -rf "${basedirpath}"
    mkdir -p "${basedirpath}"

    cat << EOF > "${basedirpath}/app.go"
package main
func main() {


    println("hello Golang")

}
EOF

    # -n オプションをつけると行番号を付与してくれる
    # この場合、空行を含む全行に行番号が振られる
    cat -n "${basedirpath}/app.go"

    echo '---------------------------------'

    # -b オプションをつけても行番号を付与してくれる
    # この場合、空行には行番号は振られない
    cat -b "${basedirpath}/app.go"
}

_exec