#!/bin/zsh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# sxkhd &
# # get rid of X in bspwm
# xsetroot -cursor_name left_ptr &
# exec feh --randomize --bg-fill ~/Pictures/wallpapers/* &
# exec termite -e weechat &
# exec deluged &
# exec deluge &
# exec discord-canary &
# exec redshift &
# exec bspwm

# Colors based on wallpaper with https://github.com/dylanaraps/wal#dependencies
wal -t -i "$(< "${HOME}/.cache/wal/wal")"

exec twitchnotifier -u tacticcarrotcake &
exec i3
