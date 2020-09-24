#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "Usage: ./build.sh [path]"
    exit
fi

cd $1
export PKGDEST="../BUILD/PKGDEST"
export SRCDEST="../BUILD/SRCDEST"
export SRCPKGDEST="../BUILD/SRCPKGDEST"
export LOGDEST="../BUILD/LOGDEST"
export BUILDDIR="../BUILD/BUILDDIR"
export PKGEXT=".pkg.tar.zst"
export SRCEXT=".src.tar.zst"
makepkg --force --cleanbuild --sign
cd -
