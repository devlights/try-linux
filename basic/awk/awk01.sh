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

echo '[grep vs awk](01)'
echo '[grep]'
cat < ./main.sh | grep 'while'
echo '[awk ]'
cat < ./main.sh | awk '$1=="while" { print $0 }'

echo '[grep vs awk](02)'
echo '[grep]'
cat < ./main.sh | grep 'while' | grep -v ':'
echo '[awk ]'
cat < ./main.sh | awk '$1=="while" && $2!=":" { print $0 }'

exit 0
