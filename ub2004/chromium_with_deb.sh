#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or sudo !!"
    exit
fi

cat << EOF > /etc/apt/sources.list.d/bionic-updates.list
# for deb-based chromium. Supported only 'til 2023
# see also /etc/apt/preferences.d/chromium-deb-bionic-updates
deb http://archive.ubuntu.com/ubuntu/ bionic-updates universe
EOF

cat << EOF > /etc/apt/preferences.d/chromium-deb-bionic-updates
Package: chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra chromium-codecs-ffmpeg 
Pin: release a=bionic-updates
Pin-Priority: 900
EOF

apt update
