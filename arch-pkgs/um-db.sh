#!/usr/bin/env bash

scripts="$(dirname $0)"
source "$scripts"/.config

[ -z "$REPO_DIR" ] && read -p "REPO_DIR: " REPO_DIR
[ -z "$DB_NAME" ] && read -p "DB_NAME: " DB_NAME
[ ! -d "$REPO_DIR" ] && echo "Error: $REPO_DIR does not exist!" && exit 1
[ ! -f "$REPO_DIR"/"$DB_NAME".db.tar.zst ] && echo "Error: Run m-db.sh, before this script!" && exit 1

rm "$REPO_DIR"/"$DB_NAME".db
mv "$REPO_DIR"/"$DB_NAME".db.tar.zst "$REPO_DIR"/"$DB_NAME".db
[ -f "$REPO_DIR"/"$DB_NAME".db.tar.zst.old ] && rm "$REPO_DIR"/"$DB_NAME".db.tar.zst.old

rm "$REPO_DIR"/"$DB_NAME".db.sig
mv "$REPO_DIR"/"$DB_NAME".db.tar.zst.sig "$REPO_DIR"/"$DB_NAME".db.sig
[ -f "$REPO_DIR"/"$DB_NAME".db.tar.zst.old.sig ] && rm "$REPO_DIR"/"$DB_NAME".db.tar.zst.old.sig

rm "$REPO_DIR"/"$DB_NAME".files
mv "$REPO_DIR"/"$DB_NAME".files.tar.zst "$REPO_DIR"/"$DB_NAME".files
[ -f "$REPO_DIR"/"$DB_NAME".files.tar.zst.old ] && rm "$REPO_DIR"/"$DB_NAME".files.tar.zst.old

rm "$REPO_DIR"/"$DB_NAME".files.sig
mv "$REPO_DIR"/"$DB_NAME".files.tar.zst.sig "$REPO_DIR"/"$DB_NAME".files.sig
[ -f "$REPO_DIR"/"$DB_NAME".files.tar.zst.old.sig ] && rm "$REPO_DIR"/"$DB_NAME".files.tar.zst.old.sig
