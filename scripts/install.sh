#!/bin/bash

if [ $(id -g) -ne 0 ]; then
   echo 'script requires to run as root user'
   exit 1
fi

pushd media_build;
    make install
popd
