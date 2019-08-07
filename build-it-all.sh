#!/bin/bash
set -e

docker-compose -p RaspiDeb64-bootloader build
docker-compose -p RaspiDeb64-bootloader run builder
docker-compose -p RaspiDeb64-bootloader down
