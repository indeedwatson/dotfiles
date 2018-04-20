#!/bin/sh
# credit: nejni-marji on #i3
# swap direction: swap two containers based on their direction, visually
# depends on https://github.com/miseran/i3-tools/blob/master/focus-tool

DIRECTION=$1
i3-msg -- mark --add A
~/i3-tools/focus-tool $DIRECTION
i3-msg -- mark --add B
i3-msg swap container with mark A
i3-msg '[con_mark="A"] focus'
i3-msg '[con_mark="A"] unmark A'
i3-msg '[con_mark="B"] unmark B'
