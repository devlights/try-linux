#!/usr/bin/env bash

basedirpath=/tmp/try-linux/mkdirexample

# 実験用のディレクトリ作成
rm -rf "$basedirpath"
mkdir -p "$basedirpath"

# 何もないことを確認
echo "--------- before ---------"
ls -1 "$basedirpath"

# ３つのディレクトリを一気に作る
mkdir -p "$basedirpath"/{a,b,c}

# ディレクトリが複数生成されている
echo "--------- after ---------"
ls -1 "$basedirpath"
