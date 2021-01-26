#!/usr/bin/env bash

basedirpath=/tmp/try-linux/colexample

# 実験用のディレクトリ作成
rm -rf "$basedirpath"
mkdir -p "$basedirpath"

# CRLFとLFを混ぜたテキストファイルを出力
printf "hello\r\nworld\n" > "$basedirpath"/helloworld1.txt

# col コマンドで CR を除去
col -b < "$basedirpath"/helloworld1.txt > "$basedirpath"/helloworld2.txt

# 結果確認
echo '--------------- before ---------------'
hexdump -c "$basedirpath"/helloworld1.txt
echo '--------------- after  ---------------'
hexdump -c "$basedirpath"/helloworld2.txt
