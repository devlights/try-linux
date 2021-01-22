#!/usr/bin/env bash

#
# REFERENCES:
#   - https://www.gnu.org/software/bash/manual/html_node/Arithmetic-Expansion.html#Arithmetic-Expansion
#   - https://tldp.org/LDP/abs/html/arithexp.html
#   - https://qiita.com/toshiro3/items/647d7fc4a1d4e3232b66
# 

## arithmetic compound command (算術複合コマンド)
#
# From CodeFactor issue message
#
#   The (( .. )) arithmetic compound command evaluates expressions in the same way as let, 
#   except it's not subject to glob expansion and therefore requires no additional quoting or escaping.
#
#   This warning only triggers in Bash/Ksh scripts. In Sh/Dash, neither let nor (( .. )) are defined, 
#   but can be simulated with [ $(( expr )) -ne 0 ] to retain exit code, or : $(( expr )) to ignore it.
#
#   (( ... )) 算術複合コマンドは let と同じように式を評価しますが、
#   グロブ展開の対象にならないので、追加のクォートやエスケープが必要ありません。
#
#   この警告は Bash/Ksh スクリプトでのみ発生します。Sh/Dash では let も (( ... )) も定義されていませんが、 
#   [ $(( expr )) -ne 0 ] で終了コードを保持したり、 : $(( expr )) で無視したりすることができます。
#
#   Thanks DeepL Translator (https://www.deepl.com/ja/translator)
#
declare -i i1=10
declare -i i2=0

(( i1++ ))
echo "${i1}"

# glob 展開の対象にならないので * をそのまま使える
(( i2=i1*5 ))
echo "${i2}"
