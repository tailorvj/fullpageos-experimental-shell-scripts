#!/bin/bash

if ping -q -c 1 -W 1 208.67.222.222 >/dev/null; then
  echo "Connected to Internet. Checking for updates..."
  cd ~/electron/fullpagedashboard-client
  git fetch origin master
  reslog=$(git log HEAD..origin/master --oneline)
    if [[ "${reslog}" != "" ]] ; then
      sudo reboot
    else
      echo "fullpagedashboard-client is up to date, skipping update."
    fi
else
  echo "Not connected to Internet. No updates for you"
fi