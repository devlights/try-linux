#!/usr/bin/env bash

#
# ddコマンドを使ってデータを任意のサイズに分割
#
# REFERENCES:
#   - https://www.gnu.org/software/gawk/manual/gawk.html
#   - https://www.gnu.org/software/gawk/manual/gawk.html#Printf-Examples
#   - https://www.gnu.org/software/coreutils/manual/html_node/sort-invocation.html
#   - https://www.gnu.org/software/coreutils/manual/html_node/dd-invocation.html#dd-invocation
#
basedirpath=/tmp/try-linux/split/using_dd

rm -rf "${basedirpath}"
mkdir -p "${basedirpath}"

## テスト用のファイルを生成
#
# 500KBのファイル
dd if=/dev/zero of="${basedirpath}/zero.bin" bs=1024 count=500 2>/dev/null

## 生成したファイルのサイズを保持（分割時に利用する)
#
_size=$(ls -l "${basedirpath}/zero.bin" | awk '{print $5}')
echo "FileSize: ${_size}"

## 30KBずつで分割
#
_srcfile="${basedirpath}/zero.bin"
_chunk=$(( 1024 * 30 ))
_total=0
_count=0

while [ "${_total}" -lt "${_size}" ]
do
    (( _count++ ))

    # きっちり分割できない場合でもエラーにならずに入力ファイルの最後まで
    # 書き出してもらうために conv=noerror オプションを付与
    #
    # また、skip オプションを指定しているので、必要なメモリ容量は一定となるようにしている
    dd \
        conv=noerror \
        if="${_srcfile}" \
        of="${_srcfile}.${_count}" \
        bs="${_chunk}" \
        skip="$(( _count - 1 ))" \
        count=1 \
        2>/dev/null

    _total=$(( _total + _chunk ))
done

echo "Split: ${_count} files"

## 確認
#
# - ls -l の先頭行は total xxxx という表示になるので除外 (awk '{if (NR>1) printf "%6d %s\n",$5,$9}')
# - 分割数が10個以上になると、そのままだと数字順に並ばないのでソート (sort -n -t . -k 3)
#   - -n : --numeric-sort (数値でソート)
#   - -t : --field-separator (指定した文字をセパレータとして利用)
#   - -k : --key (ソート対象とするカラム位置)
#
ls -l "${basedirpath}" \
    | awk '{if (NR>1) printf "%6d %s\n",$5,$9}' \
    | sort -n -t . -k 3

echo '----------------------------------------------------'

## 復元
#
cat $(ls ${basedirpath}/zero.bin.* | sort -n -t . -k 3) > "${basedirpath}/zero.bin.restore"
ls -l "${basedirpath}"/{zero.bin,zero.bin.restore}

echo '----------------------------------------------------'

## 復元確認
#
diff -s "${basedirpath}"/{zero.bin,zero.bin.restore}
