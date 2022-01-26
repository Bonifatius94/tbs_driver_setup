#!/bin/bash

UNPRIV_USER=$1

if [ $(id -g) -ne 0 ]; then
   echo 'script requires to run as root user'
   exit 1
fi

./scripts/setup_compiler.sh
./scripts/setup_firmware.sh

sudo -u $UNPRIV_USER ./scripts/setup_src.sh
./scripts/cleanup.sh

sudo -u $UNPRIV_USER ./scripts/rebuild.sh
./scripts/install.sh
