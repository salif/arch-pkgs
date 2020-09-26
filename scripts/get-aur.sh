#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "Usage: get-aur.sh [name]"
    exit
fi

name="$1"
out="$2"
git clone --depth=1 https://aur.archlinux.org/"$name".git $out
