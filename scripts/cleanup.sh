#!/bin/bash

if [ $(id -g) -ne 0 ]; then
   echo 'script requires to run as root user'
   exit 1
fi

rm -rf /lib/modules/$(uname -r)/kernel/drivers/media/*

pushd media;
    git clean -xdf
popd

pushd media_build;
    git clean -xdf
    make distclean

    if [ ! -f v4l/drx39xxj.h ]; then
        mkdir -p v4l/drx39xyj
        cp v4l/drx39xxj.h v4l/drx39xyj/
    fi
popd
