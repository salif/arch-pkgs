#!/usr/bin/env bash

read -p "name: " name
[ -d "$name" ] && echo "Error: $name already exist!" && exit 1
echo "types:
 1: PKGBUILD.proto
 2: PKGBUILD-vcs.proto
 3: PKGBUILD-split.proto"
read -p "type (1|2|3): " t
case "$t" in
    "1")
        mkdir -p "$name"
        cp /usr/share/pacman/PKGBUILD.proto ./"$name"/PKGBUILD
        ;;
    "2")
        mkdir -p "$name"
        cp /usr/share/pacman/PKGBUILD-vcs.proto ./"$name"/PKGBUILD
        ;;
    "3")
        mkdir -p "$name"
        cp /usr/share/pacman/PKGBUILD-split.proto ./"$name"/PKGBUILD
        ;;
    *)
        echo "Invalid type!"
        exit 1
        ;;
esac
