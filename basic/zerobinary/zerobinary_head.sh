#!/usr/bin/env bash

basedirpath=/tmp/try-linux/zerobinary

rm -rf "${basedirpath}"
mkdir -p "${basedirpath}"

## 指定したサイズで中身が \0 のデータのファイルを作る
#
head -c 1024 /dev/zero > "${basedirpath}/zero.bin"

# 確認
echo '----------------------------------------------'
ls -l "${basedirpath}/zero.bin"
hexdump "${basedirpath}/zero.bin"

## 中身を \1 のデータのファイルを作る
#
head -c 1024 /dev/zero | tr '\0' '\1' > "${basedirpath}/one.bin"

# 確認
echo '----------------------------------------------'
ls -l "${basedirpath}/one.bin"
hexdump "${basedirpath}/one.bin"
