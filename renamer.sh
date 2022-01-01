#!/bin/bash
# renames all the files is a series of directories to have leading zeros up to 000X 
BASE=$(pwd)
for d in */ ; do
    echo "working with $d"
    cd "$d"
    COUNT=$(ls -1 | grep -c .cbz)
    DIGITS=$(echo "${#COUNT}")
    if [ "$DIGITS" -eq "2" ]; then
        rename -e 's/\d+/sprintf("%02d",$&)/e' -- *.cbz
    elif [ "$DIGITS" -eq "3" ]; then
        rename -e 's/\d+/sprintf("%03d",$&)/e' -- *.cbz
    elif [ "$DIGITS" -eq "4" ]; then
        rename -e 's/\d+/sprintf("%04d",$&)/e' -- *.cbz
    fi
    cd "$BASE"
done
