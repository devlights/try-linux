#!/usr/bin/env bash

#
# REFERENCES:
#   - https://www.greptips.com/posts/301/
#   - https://qiita.com/richmikan@github/items/b6fb641e5b2b9af3522e
#   - https://www.gnu.org/software/findutils/manual/html_node/find_html/Regular-Expressions.html
#

basedirpath=/tmp/try-linux/findregex

rm -rf "${basedirpath}"
mkdir -p "${basedirpath}"

## テスト用のファイルを生成
#
seq -w 1 100 | xargs -I{seq} touch "${basedirpath}/findregex_{seq}.txt"
echo $(ls -1 "${basedirpath}" | wc -l) 'files was generated' 

## 基本正規表現 (BRE) メタ文字セットで検索
#
# 基本正規表現 (BRE) で検索する場合は
#   -regextype posix-basic
# を使用する。
#
# これは、 grep で -E をつけない場合と同じ
#
# どの正規表現モードを利用するかを -regextype で指定して
# 実際の正規表現は -regex で指定する。
#
# この際、注意点として「部分一致」とはならないことに注意
# find の結果は そこまでのディレクトリも含めたパスとなっているので
# ファイル名だけの正規表現を指定しても何もヒットしない。
#
# なので、通常は 先頭と必要であれば末尾に .* を付与したりする。
#
echo '[posix-basic1] -----------------------------------------------'
find "${basedirpath}" -type f -regextype posix-basic -regex ".*findregex_[0]\{2\}[0-3]\.txt$" -print

# BRE では、繰り返し指定子はエスケープしないと使えないので、エスケープしない場合だとヒットしない
# ERE では、これらはエスケープ不要となっている
echo '[posix-basic2] -----------------------------------------------'
find "${basedirpath}" -type f -regextype posix-basic -regex ".*findregex_[0]{2}[0-3]\.txt$" -print


## 拡張正規表現 (ERE) メタ文字セットで検索
#
# 拡張正規表現 (ERE) で検索する場合は
#   -regextype posix-egrep
# を使用する。
#
# これは、 grep で -E を付けた場合と同じ
#
echo '[posix-egrep1] -----------------------------------------------'
find "${basedirpath}" -type f -regextype posix-egrep -regex ".*findregex_[01][056]{2}\.txt$" -print

echo '[posix-egrep2] -----------------------------------------------'
find "${basedirpath}" -type f -regextype posix-egrep -regex ".*findregex_10+\.txt$" -print
