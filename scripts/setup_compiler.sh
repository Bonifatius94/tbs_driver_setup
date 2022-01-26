#!/bin/bash

if [ $(id -g) -ne 0 ]; then
   echo 'script requires to run as root user'
   exit 1
fi

gcc --version
if [ $? -ne 0 ]; then
    apt-get update && apt-get install -y build-essential
fi

make --version
if [ $? -ne 0 ]; then
    apt-get update && apt-get install -y make
fi

dpgk -s patchutils
if [ $? -ne 0 ]; then
    apt-get update && apt-get install -y patchutils
fi

dpgk -s libproc-processtable-perl
if [ $? -ne 0 ]; then
    apt-get update && apt-get install -y libproc-processtable-perl
fi

# original instructions suggested by vendor
# =========================================
#apt-get update && apt-get install -y gcc-8 g++-8 patchutils
#rm /usr/bin/gcc /usr/bin/g++
#ln -s gcc-8 gcc
#ln -s g++-8 g++
