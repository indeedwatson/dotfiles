if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

eval $(systemctl --user show-environment | grep SSH_AUTH_SOCK)
export SSH_AUTH_SOCK

# User specific environment
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

[ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] && startx
