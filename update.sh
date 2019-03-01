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
  echo "Connected to Internet. Checking for updates..."
  cd ~/electron/fullpagedashboard-client
  git fetch origin
  reslog=$(git log HEAD..origin/experimental --oneline)
    if [[ "${reslog}" != "" ]] ; then
      git merge --no-edit origin/experimental # completing the pull
      npm install
      echo "fullpagedashboard-client has been updated."
    else
      echo "fullpagedashboard-client is up to date, skipping update."
    fi
  cd ~/electron/fullpageos-experimental-shell-scripts
  git fetch origin
  reslog=$(git log HEAD..origin/master --oneline)
    if [[ "${reslog}" != "" ]] ; then
      git merge --no-edit origin/master # completing the pull
      echo "fullpageos-experimental-shell-scripts has been updated."
    else
      echo "fullpageos-experimental-shell-scripts is up to date, skipping update."
    fi
else
  echo "Not connected to Internet. No updates for you"
fi
