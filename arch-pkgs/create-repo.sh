#!/usr/bin/env bash

scripts="$(dirname $0)"

read -p "REPO_DIR: " REPO_DIR
[ -d "$REPO_DIR" ] && echo "Error: $REPO_DIR already exist!" && exit 1
read -p "DB_NAME: " DB_NAME
read -p "PEXT (zst|xz|gz): " PEXT

mkdir -p "$REPO_DIR"
REPO_DIR="$REPO_DIR" DB_NAME="$DB_NAME" PEXT="$PEXT" "$scripts"/create-db.sh
