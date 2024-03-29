#!/usr/bin/env bash

basedirpath=/tmp/try-linux/greponlymatching

rm -rf "${basedirpath}"
mkdir -p "${basedirpath}"

#
# grepのデフォルトの挙動は「マッチした行」を表示だが
# -o オプションを付与すると「マッチした部分」のみを表示してくれる
#
echo '********* Hello World *********' | grep 'He...'
echo '-------------------------------'
echo '********* Hello World *********' | grep -o 'He...'

echo 'golang java csharp rust javascript python' | grep -E '[^ ]{6,}'
echo '-------------------------------'
echo 'golang java csharp rust javascript python' | grep -o -E '[^ ]{6,}'
echo '-------------------------------'
echo 'golang java csharp rust javascript python' | grep -o -E '[^ ]{6,}' | sort | tr '[:lower:]' '[:upper:]'