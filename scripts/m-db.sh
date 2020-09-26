#!/usr/bin/env bash

if [ $# -lt 2 ]
then
    echo "Usage: m-db.sh [db] [name]"
    exit
fi

db="$1"
name="$2"

[ ! -d "$db" ] && echo "Error: '$db' does not exist!" && exit 1
[ -f "$db"/"$name".db.tar.zst ] && echo "Error: Run um-db.sh, before this script!" && exit 1

mv "$db"/"$name".db "$db"/"$name".db.tar.zst
ln -sr "$db"/"$name".db.tar.zst "$db"/"$name".db 
mv "$db"/"$name".db.sig "$db"/"$name".db.tar.zst.sig
ln -sr "$db"/"$name".db.tar.zst.sig "$db"/"$name".db.sig
mv "$db"/"$name".files "$db"/"$name".files.tar.zst
ln -sr "$db"/"$name".files.tar.zst "$db"/"$name".files
mv "$db"/"$name".files.sig "$db"/"$name".files.tar.zst.sig
ln -sr "$db"/"$name".files.tar.zst.sig "$db"/"$name".files.sig
