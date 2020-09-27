#!/usr/bin/env bash

read -p "name: " name
git clone --depth=1 https://aur.archlinux.org/"$name".git
[ -d "$name" ] && rm -rf ./"$name"/.git
