#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yama/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz promptinit
promptinit

EDITOR=vim

# Powerline
# if [ -f /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh ];
#     then
#         powerline-daemon -q
#         POWERLINE_BASH_CONTINUATION=1
#         POWERLINE_BASH_SELECT=1
#         . /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
# fi

if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi

# Colored man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Import colorscheme from 'wal'
(wal -r &)
