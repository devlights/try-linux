#!/usr/bin/env bash

#
# REFERENCES:
#   - https://stackoverflow.com/questions/34159451/splitting-big-block-of-binary-into-8-bit-chunks-in-bash
#   - https://unix.stackexchange.com/questions/65280/binary-to-hexadecimal-and-decimal-in-a-shell-script
#   - https://unix.stackexchange.com/questions/464808/bc-why-does-ibase-16-obase-10-ff-returns-ff-and-not-255
#   - https://www.shell-tips.com/bash/math-arithmetic-calculation/
#
target=FF
echo "TARGET: ${target}"

# bc コマンドを使って 16進数 を 10進数 に変換
echo '--------- with bc command ---------'
echo "obase=10; ibase=16; ${target}" | bc

# bash の算術機能を使って 16進数 を 10進数 に変換
echo '--------- with bash arithmetic expasion ---------'
printf "%d\n" "$((16#${target}))"