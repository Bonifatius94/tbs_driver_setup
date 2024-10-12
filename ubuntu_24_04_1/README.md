
# Setup

## Install Build Tools

```sh
sudo apt-get update && sudo apt-get install -y \
    build-essential make patchutils libproc-processtable-perl wget
```

## Set Up Firmware

```sh
MAIN_FIRMWARE_URL=http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
wget -qO - $MAIN_FIRMWARE_URL | sudo tar xfj - -C /lib/firmware

# info: there used to be a download at http://www.tbsdtv.com/download/document/linux/dvb-fe-mxl5xx.fw
#       but the file is now provided through this git repo as the link doesn't work anymore
sudo cp ../firmware/dvb-fe-mxl5xx.fw /lib/firmware/
# ADD_FIRMWARE_URL=http://www.tbsdtv.com/download/document/linux/dvb-fe-mxl5xx.fw
# wget -O /lib/firmware/dvb-fe-mxl5xx.fw $ADD_FIRMWARE_URL
```

## Download Source Code

```sh
git submodule init ./media
git submodule init ./media_build
```

## Build + Install

### Initial Build + Installation

```sh
pushd media_build;
    make dir DIR=../media
    make allyesconfig
    make -j4

    if [ ! -f v4l/drx39xxj.h ]; then
        mkdir -p v4l/drx39xyj
        cp v4l/drx39xxj.h v4l/drx39xyj/
    fi

    make -j4
popd
```

```sh
pushd media_build;
    sudo make install
popd
```

### Rebuild + Installation

```sh
sudo rm -rf /lib/modules/$(uname -r)/kernel/drivers/media/*
```

```sh
pushd media_build;
    make distclean
    make dir DIR=../media
    make allyesconfig
    make -j4
popd
```

```sh
pushd media_build;
    sudo make install
popd
```
