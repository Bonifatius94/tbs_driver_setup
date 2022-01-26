# Build and Install TBSDTV Driver

## About
This is a collection of scripts to set up TBSDTV TV card drivers on Ubuntu/Debian.
It's supposed to handle common setup issues, etc. and help non-geeks to install the driver.

## Usage
Run following commands to run the scripts:

```sh
# make sure that git is installed
sudo apt-get update && sudo apt-get install -y git

# clone the scripts from GitHub
git clone https://github.com/Bonifatius94/tbs_driver_setup.git
cd tbs_driver_setup

# run the main script
sudo ./setup_tbs.sh $USER
```

## Disclaimer
I don't own rights on the firmware file in the firmware folder. It's an
official TBS download that became unavailable, so I decided to provide it.
In case the owner wants me to take the file down, please let me know.

## License
This software is available under the terms of the MIT license.
