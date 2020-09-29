#!/usr/bin/env bash

scripts="$(dirname $0)"
source "$scripts"/config

[ -z "$REPO_DIR" ] && read -p "REPO_DIR: " REPO_DIR
[ -z "$DB_NAME" ] && read -p "DB_NAME: " DB_NAME
[ -z "$GKEY" ] && read -p "GKEY: " GKEY
[ -z "$PEXT" ] && read -p "PEXT: " PEXT

[ ! -d "$REPO_DIR" ] && echo "Error: $REPO_DIR does not exist!" && exit 1

repo-add -s -k "$GKEY" "$REPO_DIR"/"$DB_NAME".db.tar."$PEXT"
REPO_DIR="$REPO_DIR" DB_NAME="$DB_NAME" "$scripts"/um-db.sh
