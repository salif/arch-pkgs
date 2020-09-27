#!/usr/bin/env bash

scripts="$(dirname $0)"

read -p "REPO_DIR: " REPO_DIR
read -p "DB_NAME: " DB_NAME

[ -d "$REPO_DIR" ] && echo "Error: $REPO_DIR already exist!" && exit 1
mkdir -p "$REPO_DIR"
REPO_DIR="$REPO_DIR" DB_NAME="$DB_NAME" "$scripts"/create-db.sh
