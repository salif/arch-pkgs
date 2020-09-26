#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "Usage: build.sh [name]"
    exit
fi

[ ! -d "BUILD" ] && echo "Error: The build directory does not exist!" && exit 1

export PKGDEST="../BUILD/PKGDEST"
export SRCDEST="../BUILD/SRCDEST"
export SRCPKGDEST="../BUILD/SRCPKGDEST"
export LOGDEST="../BUILD/LOGDEST"
export BUILDDIR="../BUILD/BUILDDIR"
export PKGEXT=".pkg.tar.zst"
export SRCEXT=".src.tar.zst"
(cd "$1" && makepkg --force --cleanbuild --sign)
