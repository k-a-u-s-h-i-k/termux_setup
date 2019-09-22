#!/bin/bash

# needed to get access to android storage
termux-setup-storage

# needed to send notifications to android system. You must have termux-api app downloaded from play store
pkg install termux-api

# update the repos and install python ffmpeg and youtube-dl
pkg update && pkg upgrade && pkg install python ffmpeg && pip install youtube-dl

# setup arguments to pass to youtube-dl
mkdir -p ~/.config/youtube-dl
cat << HERE > ~/.config/youtube-dl/config
-f "bestaudio[ext=m4a]"
--no-mtime
-o /data/data/com.termux/files/home/storage/shared/Music/Youtube/%(extractor_key)s/%(uploader)s/%(title)s-%(id)s.%(ext)s
HERE

# setup to download to share menu
mkdir ~/bin
cat << HERE > ~/bin/termux-url-opener
#!/bin/bash
url=$1
youtube-dl $url
termux-notification --title "YouTube-DL" --content "Completed: $url"
HERE

cat << HERE > ~/.bashrc
pkg upgrade && pip install --upgrade pip && pip install --upgrade youtube-dl
HERE
