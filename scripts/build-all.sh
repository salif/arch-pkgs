#!/usr/bin/env bash

shopt -s extglob
[ ! -d "BUILD" ] && echo "Error: The build directory does not exist!" && exit 1
scripts="$(dirname $0)"
for dir in ./!(BUILD|scripts|otf-omono)/; do
    "$scripts"/build.sh "$(echo -n $dir | cut -d '/' -f 2)"
done
