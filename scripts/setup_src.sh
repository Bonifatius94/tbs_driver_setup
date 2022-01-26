#!/bin/bash

echo 'downloading source code from GitHub ...'

if [ ! -d media_build ]; then
    git clone https://github.com/tbsdtv/media_build.git
else
    pushd media_build;
        git remote update
        git pull
    popd
fi

if [ ! -d media ]; then
    git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest ./media
else
    pushd media;
        git remote update
        git pull
    popd
fi

echo 'download successful!'
