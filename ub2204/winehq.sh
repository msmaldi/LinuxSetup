#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or sudo !!"
    exit
fi

dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
mv winehq.key /usr/share/keyrings/winehq-archive.key

wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -sc)/winehq-$(lsb_release -sc).sources
mv winehq-$(lsb_release -sc).sources /etc/apt/sources.list.d/

apt update
