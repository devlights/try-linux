#!/usr/bin/env bash

basedirpath=/tmp/try-linux/list_proc_environ

# 実験用のディレクトリ作成
rm -rf "$basedirpath"
mkdir -p "$basedirpath"

# SIGTERMを受け取るまで待機するプログラム
cat << EOF > "$basedirpath"/main.go
package main
import (
    "os"
    "os/signal"
    "syscall"
)
func main() {
    c := make(chan os.Signal, 1)
    signal.Notify(c, syscall.SIGTERM)
    <-c
}
EOF

# プログラムをコンパイル
# ベースディレクトリを動かしたくないのでサブシェル起動して処理
(
    cd "$basedirpath"
    go build -o app main.go
)

#
# 独自の環境変数を追加せずプロセス起動
#
echo '---------- not set ----------'
"$basedirpath"/app >/dev/null 2>&1 &
app1_pid="$!"

# MY_ENV という環境変数は設定していないので何も表示されない
# /proc/pid/environ ファイルのデータは ヌル文字 で結合されていることに注意
tr '\0' '\n' < "/proc/$app1_pid/environ" | grep 'MY_ENV'
kill -SIGTERM "$app1_pid"

#
# 独自の環境変数を追加してプロセス起動
#
echo '----------     set ----------'
MY_ENV='my_env' "$basedirpath"/app >/dev/null 2>&1 &
app2_pid="$!"

# MY_ENV という環境変数を設定しているので表示される
# /proc/pid/environ ファイルのデータは ヌル文字 で結合されていることに注意
tr '\0' '\n' < "/proc/$app2_pid/environ" | grep 'MY_ENV'
kill -SIGTERM "$app2_pid"

# プロセス終了待ち
wait "$app1_pid" "$app2_pid"