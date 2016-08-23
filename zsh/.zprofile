[ ! -s ~/.config/mpd/pid] && mpd
[ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] && exec startx
