#!/bin/bash

if [ $(id -g) -ne 0 ]; then
   echo 'script requires to run as root user'
   exit 1
fi

wget --version
if [ $? -ne 0 ]; then
    apt-get update && apt-get install -y wget
fi

MAIN_FIRMWARE_URL=http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
wget -qO - $MAIN_FIRMWARE_URL | tar xfj - -C /lib/firmware

cp ./firmware/dvb-fe-mxl5xx.fw /lib/firmware/

#ADD_FIRMWARE_URL=http://www.tbsdtv.com/download/document/linux/dvb-fe-mxl5xx.fw
#wget -O /lib/firmware/dvb-fe-mxl5xx.fw $ADD_FIRMWARE_URL
