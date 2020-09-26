#!/usr/bin/env bash

[ -d "BUILD" ] && echo "Error: The build directory already exist!" && exit 1
mkdir ./BUILD
mkdir ./BUILD/BUILDDIR
mkdir ./BUILD/LOGDEST
mkdir ./BUILD/PKGDEST
mkdir ./BUILD/SRCDEST
mkdir ./BUILD/SRCPKGDEST
