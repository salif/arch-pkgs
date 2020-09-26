#!/usr/bin/env bash

if [ $# -lt 2 ]
then
    echo "Usage: add-key.sh [key] [repo path]"
    exit
fi

[ ! -d "$2" ] && echo "Error: $2 does not exist!" && exit 1
gpg --export --armor "$1" > "$2"/"+import-me.asc"
