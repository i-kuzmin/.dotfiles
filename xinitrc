#!/bin/bash

xrdb `~/.dotfiles/Config ~/.Xresources !`

#setxkbmap -layout us,ru -option grp:shifts_toggle -option ctrl:swapcaps
#setxkbmap -option ctrl:nocaps       # Make Caps Lock a Control key
#setxkbmap -option ctrl:swapcaps     # Swap Left Control and Caps Lock

#
#xrandr --output HDMI-0 --auto
#xrandr --output DVI-0 --auto --left-of HDMI-0 --pos 1600x120

(sleep 1 && conky -c ~/.conky/clock &>/dev/null )&
#(sleep 5 && conky -c ~/.conky/conkyrc &>/dev/null )&
xset -b
urxvtd -q -f -o
compton -CGb -o 0.8 --opacity-rule "95:class_g = 'URxvt' && ! name ~= 'notransparant'"  #--opacity-rule '97:name *= "GVIM"' \

#start-pulseaudio-x11
#
pcmanfm --no-desktop -d &
feh --bg-tile /home/iku/media/pictures/background.jpg

xrandr --output DVI-0 --primary

exec i3 -c `~/.dotfiles/Config ~/.i3/config`
