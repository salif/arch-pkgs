#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "Usage: ./update.sh [repo path]"
    exit
fi

dir=$1
cp ./BUILD/PKGDEST/*.pkg.tar.zst $dir
cp ./BUILD/PKGDEST/*.pkg.tar.zst.sig $dir
repo-add -R -n -s "$dir/salifm.db.tar.zst" ./BUILD/PKGDEST/*.pkg.tar.zst
cd $dir
find -type l -exec sh -c 'PREV=$(realpath -- "$1") && rm -- "$1" && cp -ar -- "$PREV" "$1"' resolver {} \;
rm *.old
rm *.old.sig
cd -
