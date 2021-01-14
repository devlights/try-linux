#!/usr/bin/env bash

#
# REFERENCES:
#   - https://tldp.org/LDP/abs/html/here-docs.html
#   - https://qiita.com/take4s5i/items/e207cee4fb04385a9952
#

basedirpath=/tmp/try-linux/bashtips/heredoc

rm -rf "${basedirpath}"
mkdir -p "${basedirpath}"

#
# 基本的な使い方
#   << xxx がヒアドキュメントを利用するという合図
#   xxx が現れるまでは、複数行入力可能。
#   入力を終了するときは、最後の行にxxxと入力する。
#
#   xxx の部分はプレースホルダーなので、何でも良い。
#
#   ヒアドキュメントのデータは、標準入力として扱われる。
#
cat << EOF > "${basedirpath}/app.go"
package main
func main() {
    println("hello from Here Document")
}
EOF

function run_app {
    (
        cd "${basedirpath}"
        cat ./app.go
        go build -o app .
        ./app
        rm ./app
    )
}

run_app


#
# 存在するファイルの先頭に追記
#
echo -e "\n[01] ---------------------------------------------"

tmpfile=$(mktemp)
cat - << EOF "${basedirpath}/app.go" > "${tmpfile}"
// This is Bash-Here-Document example HEADER comment
EOF

mv "${tmpfile}" "${basedirpath}/app.go"

run_app

#
# 存在するファイルの末尾に追記
#
echo -e "\n[02] ---------------------------------------------"

tmpfile=$(mktemp)
cat "${basedirpath}/app.go" - << EOF > "${tmpfile}"
// This is Bash-Here-Document example FOOTER comment
EOF

mv "${tmpfile}" "${basedirpath}/app.go"

run_app

#
# ヒアドキュメントは、実行時に一時ファイルを作成している
# このファイルは自動的に削除される
#
echo -e "\n[03] ---------------------------------------------"
bash -c 'lsof -a -p $$ -d0' << EOF
EOF