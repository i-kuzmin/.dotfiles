#!/bin/bash

usermodmap=$HOME/.Xmodmap
userxresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -d $HOME/.dotfiles/Xresources.d ]; then
    xrdb -merge <(cat $HOME/.dotfiles/Xresources.d/*)
fi

if [ -f $userxresources ]; then
    xrdb -merge $userxresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset b off

log_file=$HOME/.local/var/log/i3.log
mkdir -p $(dirname $log_file)
echo "Start $(date)" > $log_file
exec ~/.dotfiles/i3/bin/run.i3> $log_file
