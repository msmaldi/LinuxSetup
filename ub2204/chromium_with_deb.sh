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
Package: chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra chromium-codecs-ffmpeg chromium-chromedriver
Pin: release a=bionic-updates
Pin-Priority: 900

Package: chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra chromium-codecs-ffmpeg chromium-chromedriver
Pin: release a=kinetic
Pin-Priority: -10

EOF

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/ubuntu-bionic.gpg

apt update