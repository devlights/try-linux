#!/usr/bin/env bash

# REFERENCES::
#  - https://www.setouchino.cloud/blogs/85
#  - https://it-ojisan.tokyo/awk-if/
#  - https://www.atmarkit.co.jp/ait/articles/1706/02/news017.html
#  - https://www.atmarkit.co.jp/ait/articles/1706/08/news015.html
#  - https://www.atmarkit.co.jp/ait/articles/1706/09/news013.html
#  - https://www.atmarkit.co.jp/ait/articles/1706/15/news021.html
#  - https://www.atmarkit.co.jp/ait/articles/1706/16/news019.html
#  - https://www.atmarkit.co.jp/ait/articles/1706/22/news016.html
#  - https://www.atmarkit.co.jp/ait/articles/1805/24/news021.html
#  - https://www.atmarkit.co.jp/ait/articles/1805/25/news035.html
#  - https://qiita.com/gorilla0513/items/4d1c610f1283bbe46f81

echo '[awk -- print column]'
echo 'a b c d e' | awk '{ print $0 }'
echo 'a b c d e' | awk '{ print $1 $2 $3 $4 $5 }'
echo 'a b c d e' | awk '{ print $1,$2,$3,$4,$5 }'
echo 'a b c d e' | awk 'OFS="," { print $1 $2 $3 $4 $5 }'
echo 'a b c d e' | awk 'OFS="," { print $1,$2,$3,$4,$5 }'

exit 0

