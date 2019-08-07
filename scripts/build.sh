#!/bin/bash
set -e

# this script must be run in a container
if [ ! -f /.dockerenv ]; then
  echo "ERROR: script must be run in a container"
  exit 1
fi

# source common variables
. common_vars

# clone repo
git clone --single-branch --branch $BRANCH --depth 1 $FIRMWARE_REPO $FIRMWARE_DIR
cd $FIRMWARE_DIR

# Create tar file
FILENAME=rpi-bootloader-v${BUILD_VER}.tar.gz
FILELIST="
boot/LICENCE.*
boot/bootcode.bin
boot/fixup*.dat
boot/start*.elf
"

tar -czf ${BUILDS}/${FILENAME} ${FILELIST}
sha256sum ${BUILDS}/${FILENAME} > ${BUILDS}/${FILENAME}.sha256

# list contents of build directory
ls -lah ${BUILDS}
