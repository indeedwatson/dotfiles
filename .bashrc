# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

EDITOR=vim

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


#==================================
# Aliases
#==================================
alias t='sh livestreamer.sh'
alias santzo='livestreamer twitch.tv/santzo84 best --player=mpv & disown'
alias tftv='livestreamer twitch.tv/teamfortresstv best --player=mpv & disown'
alias uknighted='livestreamer twitch.tv/uknighted best --player=mpv & disown'
alias prec='livestreamer twitch.tv/previouslyrecorded_live --player=mpv & disown'
alias kahmul='livestreamer twitch.tv/kahmul78  best --player=mpv & disown'
alias ..='cd ..'
alias upgrade='sudo dnf upgrade'
alias install='sudo dnf install'
