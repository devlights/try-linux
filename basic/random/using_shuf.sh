#!/usr/bin/env bash

#
# REFERENCES:
#   - https://qiita.com/Hayao0819/items/4712939f7c2d85c0e938
#   - https://stackoverflow.com/questions/2556190/random-number-from-a-range-in-a-bash-script
#   - https://www.gnu.org/software/coreutils/manual/html_node/shuf-invocation.html
#   - https://www.atmarkit.co.jp/ait/articles/1705/25/news018.html
#
# 上のQiitaで示されているオリジナル
:<<'#COMMENT_OUT'
list=($(seq 355 369))
declare -i out=0
while (( out == 0)); do
    out=$(printf "%s\n" "${list[@]}" | head -n $(( $RANDOM % ${#list[@]})) | tail -n 1)
done
echo "scale=1; ${out} / 10" | bc
echo '---------------------------------------'
#COMMENT_OUT

# shuf コマンドを使った版
shuf -i 355-369 -n 1 \
    | xargs -I{num} echo "scale=1; obase=10; ibase=10; {num} / 10" \
    | bc
