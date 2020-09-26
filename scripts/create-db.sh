#!/usr/bin/env bash

if [ $# -lt 2 ]
then
    echo "Usage: create-db.sh [db] [name]"
    exit
fi

scripts="$(dirname $0)"
db="$1"
name="$2"

[ ! -d "$db" ] && echo "Error: $db does not exist!" && exit 1

repo-add -s "$db"/"$name".db.tar.zst

echo "Remove symlinks?"
read answer
if [ "$answer" = "y" ]
then
    "$scripts"/um-db.sh "$db" "$name"
fi
