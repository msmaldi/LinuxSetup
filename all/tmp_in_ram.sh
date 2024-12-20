#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or sudo !!"
    exit
fi

if grep '# /tmp was on RAM edited after installation' /etc/fstab; then 
    echo "/tmp on RAM is already installed"
    exit
fi;

cat << EOF >> /etc/fstab
# /tmp was on RAM edited after installation
tmpfs /tmp tmpfs mode=1777,nosuid,nodev 0 0
EOF