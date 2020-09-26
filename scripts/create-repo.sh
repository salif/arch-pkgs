#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "Usage: create-repo.sh [repo path]"
    exit
fi

scripts="$(dirname $0)"
[ -d "$1" ] && echo "Error: $1 already exist!" && exit 1
mkdir -p "$1"
"$scripts"/create-db.sh "$1" "salifm"
