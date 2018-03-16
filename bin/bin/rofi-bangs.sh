#!/usr/bin/env bash
# author: unknown
# sentby: MoreChannelNoise (https://www.youtube.com/user/MoreChannelNoise)
# editby: gotbletu (https://www.youtube.com/user/gotbletu)

# demo: https://www.youtube.com/watch?v=kxJClZIXSnM
# info: this is a script to launch other rofi scripts,
#       saves us the trouble of binding multiple hotkeys for each script,
#       when we can just use one hotkey for everything.

declare -A LABELS
declare -A COMMANDS

###
# List of defined 'bangs'
# calculator
COMMANDS["="]="rofi -show calc -modi "calc:qalc +u8 -nocurrencies""
LABELS["="]=""

# poweroff
COMMANDS["off"]="systemctl poweroff"
LABELS["off"]=""

# reboot
COMMANDS["reboot"]="systemctl reboot"
LABELS["reboot"]=""

# sleep
COMMANDS["sleep"]="systemctl suspend"
LABELS["sleep"]=""

# kill x
COMMANDS["killx"]="pkill x"
LABELS["killx"]=""

# launch twitch channels
COMMANDS["twitch"]="rofi-twitch \${input}"
LABELS["twitch"]=""

# password manager
COMMANDS["pass"]="rofi-pass"
LABELS["pass"]=""
# open bookmarks
# COMMANDS["bookmarks"]="~/.scripts/rofi-scripts-collection/rofi-surfraw-bookmarks.sh"
# LABELS["bookmarks"]=""

# greenclip clipboard history
COMMANDS["clipboard"]='rofi -modi "clipboard:greenclip print" -show clipboard \
    -theme-str "#window { width: 1000; }"'
LABELS["clipboard"]=""

# mpv history
COMMANDS["mpv"]='~/bin/mpvhist'
LABELS["mpv"]=""

# SEARCH
# open custom web searches
# COMMANDS["websearch"]="~/bin/rofi-websearch.sh"
# LABELS["websearch"]=""

COMMANDS["yt"]="surfraw youtube \${input}"
LABELS["yt"]=""

COMMANDS["g"]="surfraw google \${input}"
LABELS["g"]=""

COMMANDS["w"]="surfraw wikipedia \${input}"
LABELS["w"]=""

COMMANDS["wa"]="surfraw wolfram \${input}"
LABELS["wa"]=""

COMMANDS["imdb"]="surfraw imdb \${input}"
LABELS["imdb"]=""

COMMANDS["aw"]="surfraw archwiki \${input}"
LABELS["aw"]=""

COMMANDS["ddg"]="surfraw duckduckgo \${input}"
LABELS["ddg"]=""

COMMANDS["git"]="surfraw github \${input}"
LABELS["git"]=""

COMMANDS["gis"]="surfraw gis \${input}"
LABELS["gis"]=""

COMMANDS["r"]="surfraw reddit \${input}"
LABELS["r"]=""

COMMANDS["se"]="surfraw seriouseats \${input}"
LABELS["se"]=""

COMMANDS["rarbg"]="surfraw rarbg \${input}"
LABELS["rarbg"]=""

COMMANDS["oe"]="surfraw onlyeats \${input}"
LABELS["oe"]=""


# translate

# references --------------------------
# COMMANDS[";sr2"]="chromium 'wikipedia.org/search-redirect.php?search=\" \${input}\""
# LABELS[";sr2"]=""

# COMMANDS[";piratebay"]="chromium --disk-cache-dir=/tmp/cache http://thepiratebay.org/search/\" \${input}\""
# LABELS[";piratebay"]=""

# COMMANDS[".bin"]="spacefm -r '/home/dka/bin'"
# LABELS[".bin"]=".bin"

# COMMANDS["#screenshot"]='/home/dka/bin/screenshot-scripts/myscreenshot.sh'
# LABELS["#screenshot"]="screenshot"

################################################################################
# do not edit below
################################################################################
## # Generate menu
##
function print_menu()
{
    for key in ${!LABELS[@]}
    do
  echo "$key    ${LABELS}"
     #   echo "$key    ${LABELS[$key]}"
     # my top version just shows the first field in labels row, not two words side by side
    done
}
##
# Show rofi.
##
function start()
{
    # print_menu | rofi -dmenu -p "?=>" 
    print_menu | sort | rofi -kb-row-select "Tab" -kb-row-tab "Control+space" -width 30 -dmenu  -i -p "rofi-bangs"

}


# Run it
value="$(start)"

# Split input.
# grab upto first space.
choice=${value%%\ *}
# graph remainder, minus space.
input=${value:$((${#choice}+1))}

##
# Cancelled? bail out
##
if test -z ${choice}
then
    exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}
then
    # Execute the choice
    eval echo "Executing: ${COMMANDS[$choice]}"
    eval ${COMMANDS[$choice]}
else
 eval  $choice | rofi
 # prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK) 
 #   echo "Unknown command: ${choice}" | rofi -dmenu -p "error"
fi
