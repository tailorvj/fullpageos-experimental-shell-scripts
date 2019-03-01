# fullpageos-experimental-shell-scripts

## update.sh is run by autostart and does this:

1. Backs up existing ~/.fullpagedashboard-client/.session.json file to backup folder.
1. Moves /boot/playlist.json to ~/.fullpagedashboard-client/.session.json
1. Updates fullpagedashboard-client to the latest experimental version from Github. 
1. Updates update script to the latest version from Github.

## nightly.sh is run by cron every night at 4am and does this:

1. Checks for and update to fullpagedashboard-client on Github experimental branch. 
2. If there is an update, reboots the system. 

All update work only if there is a working internet connection. 