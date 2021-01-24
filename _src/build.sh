#!/usr/bin/env bash

read -p "name: " _name
[ ! -d "$_name" ] && echo "Error: '$_name' does not exist!" && exit 1
_pwd=${PWD:-.}
if [ -z "$_dbg" ]; then
	_rmf="--rm"
else
	_rmf=""
fi
docker run $_rmf -v $_pwd/_pkg:/_pkg -v $_pwd/$_name:/_build arch-pkgs:latest /usr/local/bin/arch-pkgs-build
