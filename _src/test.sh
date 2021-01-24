#!/usr/bin/env bash

_pwd=${PWD:-.}

docker run -it --rm -v $_pwd/_pkg:/_pkg arch-pkgs:latest /usr/bin/bash
