#!/bin/bash

userresources=`$HOME/.dotfiles/Config $HOME/.Xresource !`
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

~/.bin/sw-monitor last

#setxkbmap -layout us,ru -option grp:shifts_toggle -option ctrl:swapcaps
#setxkbmap -option ctrl:nocaps       # Make Caps Lock a Control key
#setxkbmap -option ctrl:swapcaps     # Swap Left Control and Caps Lock

#
#xrandr --output HDMI-0 --auto
#xrandr --output DVI-0 --auto --left-of HDMI-0 --pos 1600x120

(sleep 1 && conky -c ~/.conky/clock &>/dev/null )&
#(sleep 5 && conky -c ~/.conky/conkyrc &>/dev/null )&
xset b off
urxvtd -q -f -o
compton -CG \
    --opacity-rule "95:class_g = 'URxvt'" \
    --opacity-rule '97:name *= "GVIM"' &

#start-pulseaudio-x11
#
pcmanfm --no-desktop -d &
feh --bg-tile /home/iku/media/pictures/background.jpg

if [ -e "~/.xrandr" ]; then
    bash ~/.xrandr
fi

log_file=/var/log/i3.log
echo "Start $(date)" > $log_file
exec ~/.dotfiles/i3/bin/run.i3> $log_file
