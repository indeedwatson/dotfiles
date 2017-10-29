#!/bin/bash
BROWSER=firefox-nightly
surfraw -browser=$BROWSER $(sr -elvi | awk -F'-' '{print $1}' | sed '/:/d' | awk '{$1=$1};1' | rofi -kb-row-select "Tab" -kb-row-tab "Control+space" -dmenu  -i -p "rofi-surfraw-websearch: ")
