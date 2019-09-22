#!/bin/bash

# update repos first
apt update && apt upgrade

# needed to send notifications to android system. You must have termux-api app downloaded from play store
apt install -y termux-api

# update the repos and install python ffmpeg and youtube-dl
apt install -y python ffmpeg && pip install youtube-dl

# setup arguments to pass to youtube-dl
mkdir -p ~/.config/youtube-dl
cat << HERE > ~/.config/youtube-dl/config
-f "bestaudio[ext=m4a]"
--no-mtime
-o /data/data/com.termux/files/home/storage/shared/Music/Youtube/%(title)s.%(ext)s
HERE

# setup to download via share menu
mkdir ~/bin
cat << 'HERE' > ~/bin/termux-url-opener
#!/bin/bash
youtube-dl $1
termux-notification --title "YouTube-DL" --content "Completed: $1"
HERE

cat << HERE > ~/.bashrc
pkg upgrade && pip install --upgrade pip && pip install --upgrade youtube-dl
HERE

# needed to get access to android storage
termux-setup-storage


