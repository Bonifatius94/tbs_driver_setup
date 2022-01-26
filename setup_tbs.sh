#!/bin/bash

if [ $(id -g) -ne 0 ]; then
   echo 'script requires to run as root user'
   exit 1
fi

./scripts/setup_compiler.sh
./scripts/setup_firmware.sh

if [ ! -d ./media ]; then
    sudo -u $USER /bin/bash -c ./scripts/setup_src.sh
else
    sudo -u $USER /bin/bash -c ./scripts/update_src.sh
fi

./scripts/cleanup.sh

sudo -u $USER /bin/bash -c ./scripts/rebuild.sh
./scripts/install.sh
