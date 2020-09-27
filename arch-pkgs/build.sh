#!/usr/bin/env bash

scripts="$(dirname $0)"
source "$scripts"/.config
read -p "name: " name

[ -z "$GKEY" ] && read -p "GKEY: " GKEY
[ -z "$PGER" ] && read -p "PGER: " PGER
[ -z "$OUT_DIR" ] && read -p "OUT_DIR: " OUT_DIR
[ -z "$M_USER" ] && read -p "M_USER: " M_USER
[ -z "$IN_DIR" ] && read -p "IN_DIR: " IN_DIR
[ ! -d "$name" ] && echo "Error: '$name' does not exist!" && exit 1

cp "$scripts"/build-shared.sh "$IN_DIR"/build.sh
cp -r "$name" "$IN_DIR"/
sudo PGER="$PGER" IN_DIR="$IN_DIR" OUT_DIR="$OUT_DIR" -u "$M_USER" "$IN_DIR"/build.sh
[ ! $? -eq 0 ] && rm -rf "$IN_DIR"/* && exit 1
{
    cd "$OUT_DIR"
    for f in *.temp; do
        b=$(basename "$f" .temp)
        cp "$f" "$b"
        rm -rf "$f"
        [ ! -f "$b".sig ] && gpg --detach-sign --use-agent -u "$GKEY" --no-armor "$b"
    done
}
rm -rf "$IN_DIR"/*
