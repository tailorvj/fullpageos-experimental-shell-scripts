#!/bin/bash

if find /boot/ -name playlist.json -print -quit |
   grep -q '^'; then
  CURRENTDATE=`date +"%Y_%m_%d_%H_%M_%S"`
  echo "/boot/playlist.json exists!"
  mkdir -p ~/.fullpagedashboard-client/backup
  cp ~/.fullpagedashboard-client/.session.json ~/.fullpagedashboard-client/backup/${CURRENTDATE}.json
  sudo mv /boot/playlist.json ~/.fullpagedashboard-client/.session.json
  sudo chown pi ~/.fullpagedashboard-client/.session.json
else
  echo "/boot/playlist.json does not exist! Doing nothing"
fi

if ping -q -c 1 -W 1 208.67.222.222 >/dev/null; then
  echo "Connected to Internet. Checking for update..."
  cd ~/electron/fullpagedashboard-client
  git pull
  npm install
else
  echo "Not connected to Internet. No updates for you"
fi
