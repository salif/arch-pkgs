#!/usr/bin/env bash

scripts="$(dirname $0)"
source "./arch-pkgs"/.config

[ -z "$M_USER" ] && read -p "M_USER: " M_USER

if [ "$USER" = "root" ]
then
    useradd -m -G users -s /usr/bin/bash "$M_USER"
    passwd "$M_USER"
    mkdir -p /var/shared/arch-pkgs
    mkdir -p /var/shared/arch-pkgs/in
    mkdir -p /var/shared/arch-pkgs/out
    chgrp -R users /var/shared/arch-pkgs
    chmod -R 2777 /var/shared/arch-pkgs
    exit
else
    echo "Error! Please run this script as root!"
    exit 1
fi
