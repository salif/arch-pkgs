#!/usr/bin/env bash

[ ! -d "BUILD" ] && echo "Error: The build directory does not exist!" && exit 1
rm -r ./BUILD
