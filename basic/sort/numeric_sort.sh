#!/usr/bin/env bash

#
# sort コマンドでファイルの数値部分でソートする
#
# REFERENCES:
#   - https://www.gnu.org/software/coreutils/manual/html_node/sort-invocation.html
#   - https://www.gnu.org/software/coreutils/manual/html_node/dd-invocation.html#dd-invocation
#
basedirpath=/tmp/try-linux/sort/numeric_sort

rm -rf "${basedirpath}"
mkdir -p "${basedirpath}"

## テスト用のファイルを生成
#
for ((i=0; i<15; i++))
do
    dd \
        if=/dev/zero \
        of="${basedirpath}/zero.bin.${i}" \
        bs=1024 \
        count=1 \
        2>/dev/null
done

## そのまま ls
#
# 数値部分を文字列で解釈するので数値順に並ばない
ls -1 "${basedirpath}"

echo '--------------------------------------------'

## オプション付けずに sort
#
# これも sort コマンドからすると何で並び替えるのかを指定していないので
# 結果は上の ls の場合と同じになる
ls -1 "${basedirpath}" | sort

echo '--------------------------------------------'

## オプションを付けて sort
#
# 以下のオプションを付与
#   - -n : --numeric-sort (数値でソート)
#   - -t : --field-separator (指定した文字をセパレータとして利用)
#   - -k : --key (ソート対象とするカラム位置)
ls -1 "${basedirpath}" | sort -n -t . -k 3
