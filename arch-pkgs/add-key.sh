#!/usr/bin/env bash

scripts="$(dirname $0)"
source "$scripts"/.config

[ -z "$GKEY" ] && read -p "GKEY: " GKEY
[ -z "$REPO_DIR" ] && read -p "REPO_DIR: " REPO_DIR

[ ! -d "$REPO_DIR" ] && echo "Error: $REPO_DIR does not exist!" && exit 1
gpg --export --armor "$GKEY" > "$REPO_DIR"/"+import-me.asc"
