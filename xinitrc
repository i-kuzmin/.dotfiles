#!/bin/bash

xrdb ~/.Xresources

#setxkbmap -layout us,ru -option grp:shifts_toggle -option ctrl:swapcaps
#setxkbmap -option ctrl:nocaps       # Make Caps Lock a Control key
#setxkbmap -option ctrl:swapcaps     # Swap Left Control and Caps Lock

#
xrandr --output LVDS-0 --auto --primary
xrandr --output HDMI-0  --auto --right-of LVDS-0
(sleep 1 && conky -c ~/.conky/clock &>/dev/null )&
#(sleep 5 && conky -c ~/.conky/conkyrc &>/dev/null )&
xset -b
urxvtd -q -f -o
compton -CGb -o 0.8 --opacity-rule "95:class_g = 'URxvt' && ! name ~= 'notransparant'"  #--opacity-rule '97:name *= "GVIM"' \

#start-pulseaudio-x11
#
pcmanfm --no-desktop -d &
feh --bg-tile /home/iku/media/pictures/background.jpg

exec i3 -c `~/.i3/Config`
