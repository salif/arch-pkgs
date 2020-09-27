#!/usr/bin/env bash

scripts="$(dirname $0)"
source "$scripts"/.config

[ -z "$REPO_DIR" ] && read -p "REPO_DIR: " REPO_DIR
[ -z "$DB_NAME" ] && read -p "DB_NAME: " DB_NAME

[ ! -d "$REPO_DIR" ] && echo "Error: '$REPO_DIR' does not exist!" && exit 1
[ -f "$REPO_DIR"/"$DB_NAME".db.tar.zst ] && echo "Error: Run um-db.sh, before this script!" && exit 1

mv "$REPO_DIR"/"$DB_NAME".db "$REPO_DIR"/"$DB_NAME".db.tar.zst
ln -sr "$REPO_DIR"/"$DB_NAME".db.tar.zst "$REPO_DIR"/"$DB_NAME".db 
mv "$REPO_DIR"/"$DB_NAME".db.sig "$REPO_DIR"/"$DB_NAME".db.tar.zst.sig
ln -sr "$REPO_DIR"/"$DB_NAME".db.tar.zst.sig "$REPO_DIR"/"$DB_NAME".db.sig
mv "$REPO_DIR"/"$DB_NAME".files "$REPO_DIR"/"$DB_NAME".files.tar.zst
ln -sr "$REPO_DIR"/"$DB_NAME".files.tar.zst "$REPO_DIR"/"$DB_NAME".files
mv "$REPO_DIR"/"$DB_NAME".files.sig "$REPO_DIR"/"$DB_NAME".files.tar.zst.sig
ln -sr "$REPO_DIR"/"$DB_NAME".files.tar.zst.sig "$REPO_DIR"/"$DB_NAME".files.sig
