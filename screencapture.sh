#!/bin/bash
# To set Firefox to open external links in the same (active) tab/window, set browser.link.open_newwindow.override.external = 1 (default is -1)
# See https://support.mozilla.org/en-US/questions/959136
# Turn off your screensaver before running

while read url
do
  # Baby, what time is it?
  timestamp=$(date +%Y%m%d%H%M%S)
  name=$(echo $url | sed 's/https:\/\///g' | sed 's/people\.stanford\.edu\//people-/g' | sed 's/sites\.stanford\.edu\//sites-/g')
  open $url -a "Firefox"
  sleep 60
  screencapture -x $name-$timestamp.jpg

done < sites-list.txt
