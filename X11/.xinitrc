#!/bin/sh

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

# LEAVE THIS  (default runners)
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# swap caps and escape
if command -v setxkbmap &> /dev/null
then
  setxkbmap -option caps:swapescape
fi

# enable touchpad (needed for i3)
if command -v xinput &> /dev/null
then
  xinput set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Tapping Enabled" 1
  xinput set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Click Method Enabled" 0 1
fi

# default resolution for host
if command -v xrandr &> /dev/null
then
  xrandr -s 2560x1440
fi

# time based coloring
if command -v redshift &> /dev/null
then
  redshift &
fi

# Run i3 for Arch host/ xfce for Kali VM
# see "startarch" and "startkali" scripts
session=${1:-i3}

case $session in
    i3) 
      # xrandr -s 2560x1440 # resolution for host machine
      exec i3;;
    xfce4) 
      exec startxfce4;;
    # No known session, try to run it as command
    *) exec $1;;
esac
