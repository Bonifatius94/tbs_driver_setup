#!/bin/bash

echo 'downloading source code from GitHub ...'
git clone https://github.com/tbsdtv/media_build.git
git clone git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest ./media
echo 'download successful!'
