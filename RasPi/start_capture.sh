#!/bin/bash

SCRIPT_PATH="`dirname \"$0\"`"
sudo $SCRIPT_PATH/gpio_watcher -o capture_`date +"%d-%m-%Y_%H:%M"`_%d.h264 -t 0 -w 1296 -h 972 -fps 25 -v
