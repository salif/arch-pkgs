#!/usr/bin/env bash

set -e

read -p "name: " _name
[ ! -d "$_name" ] && echo "Error: '$_name' does not exist!" && exit 1
_pwd=${PWD:-.}

read -p "container id: " _cid
docker commit $_cid test_image
docker container rm $_cid
docker run -it --rm -v $_pwd/_pkg:/_pkg -v $_pwd/$_name:/_build test_image /usr/bin/bash
docker image rm test_image
