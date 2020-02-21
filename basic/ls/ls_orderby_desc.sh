#!/usr/bin/env bash

directory_name='try-linux'
directory_path="/tmp/${directory_name}"

mkdir -p "${directory_path}"
cd "${directory_path}"

touch 01.txt 02.txt 03.txt
touch --date="2020-02-21 03:00:00" 01.txt
touch --date="2020-02-21 06:00:00" 02.txt
touch --date="2020-02-21 01:00:00" 03.txt

# normal (asc name)
echo '[normal (asc)]'
ls -l

# reverse (desc name)
echo '[reverse (desc)]'
ls -rl

# reverse (desc date)
echo '[reverse (desc date)]'
ls -tl

rm -rf "${directory_path}"

exit 0
