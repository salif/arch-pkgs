#!/usr/bin/env bash

if [ $# -lt 2 ]
then
    echo "Usage: um-db.sh [db] [name]"
    exit
fi

db="$1"
name="$2"

[ ! -d "$db" ] && echo "Error: $db does not exist!" && exit 1
[ ! -f "$db"/"$name".db.tar.zst ] && echo "Error: Run m-db.sh, before this script!" && exit 1

rm "$db"/"$name".db
mv "$db"/"$name".db.tar.zst "$db"/"$name".db
rm "$db"/"$name".db.tar.zst.old

rm "$db"/"$name".db.sig
mv "$db"/"$name".db.tar.zst.sig "$db"/"$name".db.sig
rm "$db"/"$name".db.tar.zst.old.sig

rm "$db"/"$name".files
mv "$db"/"$name".files.tar.zst "$db"/"$name".files
rm "$db"/"$name".files.tar.zst.old

rm "$db"/"$name".files.sig
mv "$db"/"$name".files.tar.zst.sig "$db"/"$name".files.sig
rm "$db"/"$name".files.tar.zst.old.sig
