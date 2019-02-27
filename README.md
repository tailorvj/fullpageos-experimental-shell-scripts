# fullpageos-experimental-shell-scripts

start-electron-dashboard.sh is run by autostart and does two things:

1. Backs up existing ~/.fullpagedashboard-client/.session.json file to backup folder.
1. Moves /boot/playlist.json to ~/.fullpagedashboard-client/.session.json
1. Updates fullpagedashboard-client to the latest experimental version from Github. 