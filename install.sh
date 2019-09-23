#!/bin/bash

# update repos first
apt -y update && apt -y upgrade

# needed to send notifications to android system. You must have termux-api app downloaded from play store
apt install -y termux-api

# install all necessary tools
apt install -y git python ffmpeg atomicparsley jq && pip install youtube-dl && pip install --upgrade pip

# clone repo
git clone https://github.com/k-a-u-s-h-i-k/termux_setup.git repo

# setup arguments to pass to youtube-dl
mkdir -p ~/.config/youtube-dl
ln -s ~/repo/config ~/.config/youtube-dl/config

# setup to download via share menu
mkdir ~/bin
ln -s ~/repo/termux-url-opener ~/bin/termux-url-opener

# auto update script
ln -s ~/repo/bashrc ~/.bashrc

# termux properties
ln -s ~/repo/termux.properties ~/.termux.properties

# needed to get access to android storage
termux-setup-storage

echo -e '\n\n \033[0;32m Setup completed successfully \033[0m'
