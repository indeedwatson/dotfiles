#!/bin/bash
## launch livestreamer with best as default quality
channel=$1
defquality=best
quality=${2:-$defquality}

livestreamer http://www.twitch.tv/$channel $quality --player=mpv &
