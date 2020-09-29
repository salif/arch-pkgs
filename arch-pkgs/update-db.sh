#!/usr/bin/env bash

scripts="$(dirname $0)"
source "$scripts"/config

[ -z "$OUT_DIR" ] && read -p "OUT_DIR: " OUT_DIR
[ -z "$REPO_DIR" ] && read -p "REPO_DIR: " REPO_DIR
[ -z "$DB_NAME" ] && read -p "DB_NAME: " DB_NAME
[ -z "$PEXT" ] && read -p "PEXT: " PEXT

[ ! -d "$REPO_DIR" ] && echo "Error: '$REPO_DIR' does not exist!" && exit 1
REPO_DIR="$REPO_DIR" DB_NAME="$DB_NAME" PEXT="$PEXT" "$scripts"/m-db.sh

for p in "$OUT_DIR"/*.pkg.tar."$PEXT"; do
    echo "'$p' will be added, ok? (y/n)"
    read answer
    if [ "$answer" = "y" ]
    then
        cp "$p" "$REPO_DIR"/
        cp "$p".sig "$REPO_DIR"/
        repo-add -R -n -s -k "$GKEY" "$REPO_DIR"/"$DB_NAME".db.tar."$PEXT" "$REPO_DIR"/$(basename "$p")
    fi
done

REPO_DIR="$REPO_DIR" DB_NAME="$DB_NAME" PEXT="$PEXT" "$scripts"/um-db.sh

echo "Remove OUT_DIR? (y/n)"
read answer
[ "$answer" = "y" ] && rm -rf "$OUT_DIR"/*
