#!/usr/bin/env bash

#
# Linux Kernel バージョンの表示
#
# REFERENCES:
#   - https://linuxhint.com/check-the-linux-kernel-version/
#

# uname コマンドで確認
uname -r

# /proc テーブルからも確認できる
cat /proc/version
