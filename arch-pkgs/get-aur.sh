#!/usr/bin/env bash

read -p "name: " name
git clone --depth=1 https://aur.archlinux.org/"$name".git
[ -d "$name"/.git ] && rm -rf ./"$name"/.git
[ -f "$name"/.gitignore ] && rm -f ./"$name"/.gitignore
[ -f "$name"/.SRCINFO ] && rm -f ./"$name"/.SRCINFO
