#!/bin/bash

# Setup screns
xrandr --output HDMI-0 --auto --primary --output DVI-1 --auto --right-of HDMI-0

# load resources
xrdb $HOME/.dotfiles/looks/Xresources

setxkbmap no

# Wallpaper
nitrogen --restore

# Starting up rxvt-unicode server
urxvtd -q -f -o

# nice shadows
seq 0 1 | xargs -l1 -I@ compton --config $HOME/.dotfiles/compton.conf -b -d :0.@

sxhkd &
#exec bspwm
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session bspwm
