#!/bin/bash

# Load resources



# Set up an icon tray
#stalonetray &

# Fire up apps

xscreensaver -no-splash &

if [ -x /usr/bin/cmst ] ; then
       cmst &
fi
dunst &
xmobar &
urxvt
exec xmonad
