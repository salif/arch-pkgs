#!/usr/bin/env bash

scripts="$(dirname $0)"
source "$scripts"/config

[ -z "$REPO_DIR" ] && read -p "REPO_DIR: " REPO_DIR
[ -z "$DB_NAME" ] && read -p "DB_NAME: " DB_NAME
[ -z "$PEXT" ] && read -p "PEXT: " PEXT

[ ! -d "$REPO_DIR" ] && echo "Error: '$REPO_DIR' does not exist!" && exit 1
[ -f "$REPO_DIR"/"$DB_NAME".db.tar."$PEXT" ] && echo "Error: Run um-db.sh, before this script!" && exit 1

mv "$REPO_DIR"/"$DB_NAME".db "$REPO_DIR"/"$DB_NAME".db.tar."$PEXT"
ln -sr "$REPO_DIR"/"$DB_NAME".db.tar."$PEXT" "$REPO_DIR"/"$DB_NAME".db 
mv "$REPO_DIR"/"$DB_NAME".db.sig "$REPO_DIR"/"$DB_NAME".db.tar."$PEXT".sig
ln -sr "$REPO_DIR"/"$DB_NAME".db.tar."$PEXT".sig "$REPO_DIR"/"$DB_NAME".db.sig
mv "$REPO_DIR"/"$DB_NAME".files "$REPO_DIR"/"$DB_NAME".files.tar."$PEXT"
ln -sr "$REPO_DIR"/"$DB_NAME".files.tar."$PEXT" "$REPO_DIR"/"$DB_NAME".files
mv "$REPO_DIR"/"$DB_NAME".files.sig "$REPO_DIR"/"$DB_NAME".files.tar."$PEXT".sig
ln -sr "$REPO_DIR"/"$DB_NAME".files.tar."$PEXT".sig "$REPO_DIR"/"$DB_NAME".files.sig
