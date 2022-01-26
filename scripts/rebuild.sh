#!/bin/bash

pushd media_build;
    make dir DIR=../media
    make allyesconfig
    make -j4
popd
