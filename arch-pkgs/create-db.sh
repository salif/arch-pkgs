#!/usr/bin/env bash

scripts="$(dirname $0)"
source "$scripts"/.config

[ -z "$REPO_DIR" ] && read -p "REPO_DIR: " REPO_DIR
[ -z "$DB_NAME" ] && read -p "DB_NAME: " DB_NAME

[ ! -d "$REPO_DIR" ] && echo "Error: $REPO_DIR does not exist!" && exit 1

repo-add -s "$REPO_DIR"/"$DB_NAME".db.tar.zst
REPO_DIR="$REPO_DIR" DB_NAME="$DB_NAME" "$scripts"/um-db.sh
