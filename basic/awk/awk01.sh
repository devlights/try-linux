#!/usr/bin/env bash

# REFERENCES::
#  - https://www.setouchino.cloud/blogs/85
#  - https://it-ojisan.tokyo/awk-if/

echo '[grep vs awk](01)'
echo '[grep]'
cat ./main.sh | grep 'while'
echo '[awk ]'
cat ./main.sh | awk '$1=="while" { print $0 }'

echo '[grep vs awk](02)'
echo '[grep]'
cat ./main.sh | grep 'while' | grep -v ':'
echo '[awk ]'
cat ./main.sh | awk '$1=="while" && $2!=":" { print $0 }'

exit 0
