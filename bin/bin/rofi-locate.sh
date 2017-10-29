#!/bin/bash
#
# https://github.com/gotbletu/shownotes/blob/master/rofi-scripts-collection/rofi-locate.sh

xdg-open "$(locate home | rofi -threads 0 -width 95 -dmenu -i -p "find:")"
