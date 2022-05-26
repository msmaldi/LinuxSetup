#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or sudo !!"
    exit
fi

sed -i '/ swap / s/^/# /' /etc/fstab
swapoff -a
rm -rf /swapfile
