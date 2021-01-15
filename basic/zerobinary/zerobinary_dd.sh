#!/usr/bin/env bash

basedirpath=/tmp/try-linux/zerobinary

rm -rf "${basedirpath}"
mkdir -p "${basedirpath}"

## 指定したサイズで中身が \0 のデータのファイルを作る
#
dd if=/dev/zero of="${basedirpath}/zero.bin" bs=1024 count=1 2>/dev/null

# 確認
echo '----------------------------------------------'
ls -l "${basedirpath}/zero.bin"
hexdump "${basedirpath}/zero.bin"

## 中身を \1 のデータのファイルを作る
#
tmpfile=$(mktemp)
dd if=/dev/zero of="${tmpfile}" bs=1024 count=1 2>/dev/null
tr '\0' '\1' < "${tmpfile}" > "${basedirpath}/one.bin"

# 確認
echo '----------------------------------------------'
ls -l "${basedirpath}/one.bin"
hexdump "${basedirpath}/one.bin"
