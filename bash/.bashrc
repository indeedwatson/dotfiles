# .BASHRC

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

EDITOR=vim

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

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

# Powerline
# if [ -f /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh ];
#     then
#         powerline-daemon -q
#         POWERLINE_BASH_CONTINUATION=1
#         POWERLINE_BASH_SELECT=1
#         . /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
# fi


#Include aliases if it exists
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi
