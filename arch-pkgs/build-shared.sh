#!/usr/bin/env bash

rm -rf $HOME/build
mkdir -p $HOME/build/pkgdest
mkdir -p $HOME/build/srcdest
mkdir -p $HOME/build/srcpkgdest
mkdir -p $HOME/build/logdest
mkdir -p $HOME/build/builddir

for dir in "$IN_DIR"/*/; do
    cd "$dir"
        PACKAGER="$PGER" \
        PKGDEST=$HOME/build/pkgdest \
        SRCDEST=$HOME/build/srcdest \
        SRCPKGDEST=$HOME/build/srcpkgdest \
        LOGDEST=$HOME/build/logdest \
        BUILDDIR=$HOME/build/builddir \
        PKGEXT=".pkg.tar.$PEXT" \
        SRCEXT=".src.tar.$PEXT" \
    makepkg --force --nosign
    cd $HOME/build/pkgdest/
    for f in *; do
        cp --force "$f" "$OUT_DIR"/"$f".temp
    done
done
