#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or sudo !!"
    exit
fi

apt-get purge -y firefox
apt-get install -y software-properties-common
add-apt-repository -y ppa:mozillateam/ppa

cat << EOF > /etc/apt/preferences.d/mozilla-firefox
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001

EOF


