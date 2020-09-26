#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "Usage: update-db.sh [repo path]"
    exit
fi

scripts="$(dirname $0)"
repo="$1"
[ ! -d "$repo" ] && echo "Error: '$repo' does not exist!" && exit 1
"$scripts"/m-db.sh "$repo" "salifm"

for p in ./BUILD/PKGDEST/*.pkg.tar.zst; do
    echo "'$(echo $p | cut -d '/' -f 4-)' will be added, ok? (y/n)"
    read answer
    if [ "$answer" = "y" ]
    then
        cp "$p" "$repo"
        cp "$p".sig "$repo"
        repo-add -R -n -s "$repo"/salifm.db.tar.zst "$p"
    fi
done

echo "Remove symlinks?"
read answer
if [ "$answer" = "y" ]
then
    "$scripts"/um-db.sh "$repo" "salifm"
fi
