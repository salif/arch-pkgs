#!/usr/bin/env bash

if [ $# -lt 2 ]
then
    echo "Usage: ./init.sh [repo path] [gpg key]"
    exit
fi

rm -rf ./BUILD
mkdir BUILD
mkdir BUILD/BUILDDIR
mkdir BUILD/LOGDEST
mkdir BUILD/PKGDEST
mkdir BUILD/SRCDEST
mkdir BUILD/SRCPKGDEST

dir=$1
mkdir -p $dir
cd $dir
gpg --export --armor "$2" > "+import-me.asc"
repo-add -s salifm.db.tar.zst
find -type l -exec sh -c 'PREV=$(realpath -- "$1") && rm -- "$1" && cp -ar -- "$PREV" "$1"' resolver {} \;
cd -
