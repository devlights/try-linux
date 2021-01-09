#!/usr/bin/env bash

#
# REFERENCES:
#   - https://stackoverflow.com/questions/34159451/splitting-big-block-of-binary-into-8-bit-chunks-in-bash
#   - https://unix.stackexchange.com/questions/65280/binary-to-hexadecimal-and-decimal-in-a-shell-script
#   - https://unix.stackexchange.com/questions/464808/bc-why-does-ibase-16-obase-10-ff-returns-ff-and-not-255
#
target=AAF00F55
echo "TARGET: ${target}"

# bc コマンドを使って 16 進数を 2 進数に変換
echo '--------- with bc command ---------'
echo "obase=2; ibase=16; ${target}" | bc

# bc コマンドの結果を、さらに fold コマンドで 8桁 ずつで折りたたみ
echo '--------- with bc command with fold command ---------'
echo "obase=2; ibase=16; ${target}" | bc | fold -w 8
