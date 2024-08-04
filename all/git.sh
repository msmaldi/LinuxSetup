#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or sudo !!"
    exit
fi

apt install git -y

git config --global user.name "Matheus Maldi"
git config --global user.email msmaldi@hotmail.com

git config --global init.defaultBranch master
