#!/usr/bin/env bash

# REFERENCES::
#  - https://www.setouchino.cloud/blogs/85
#  - https://it-ojisan.tokyo/awk-if/

echo '[awk -- print column]'
echo 'a b c d e' | awk '{ print $0 }'
echo 'a b c d e' | awk '{ print $1 $2 $3 $4 $5 }'
echo 'a b c d e' | awk '{ print $1,$2,$3,$4,$5 }'
echo 'a b c d e' | awk 'OFS="," { print $1 $2 $3 $4 $5 }'
echo 'a b c d e' | awk 'OFS="," { print $1,$2,$3,$4,$5 }'

exit 0

