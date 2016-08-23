if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# User specific environment
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

[ ! -s ~/.config/mpd/pid] && mpd
[ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] && exec startx
