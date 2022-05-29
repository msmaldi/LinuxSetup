#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or sudo !!"
    exit
fi

apt-get install -y software-properties-common
add-apt-repository -y ppa:obsproject/obs-studio
apt update
