#!/usr/bin/env bash

#
# REFERENCES:
#   - https://linuxhint.com/ignore-blank-lines-in-grep/
#

basedirpath=/tmp/try-linux/grepremoveemptyline

rm -rf "${basedirpath}"
mkdir -p "${basedirpath}"

## テスト用のファイルを生成
#
(
    cd "${basedirpath}" || exit
    cat <<EOF >test.txt
hello

    world


  hello2




      world2
EOF
)

## grep コマンドで空行を除去
#
fpath="${basedirpath}/test.txt"

## 元データを表示
#
echo '------------------- Original ----------------------------'
cat "${fpath}"

# (1) [:space:] を使う
echo '------------------- use [:space:] ----------------------------'
grep -E -v '^[[:space:]]*$' "${fpath}"

# (2) '\S' を使う
echo '------------------- use \S ----------------------------'
grep '\S' "${fpath}"

# (3) '^$' を使う
echo '------------------- use ^$ ----------------------------'
grep -E -v '^$' "${fpath}"
