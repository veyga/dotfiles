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

##### Settings for Arch Host (login and enter "startx") ########
## power savings
## sudo tlp start &
## sudo powertop --auto-tune &

## switch control and caps
#setxkbmap -option caps:swapescape

##enable touchpad click
#xinput set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Tapping Enabled" 1
#xinput set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Click Method Enabled" 0 1

## resolution
#xrandr -s 2560x1440
#redshift &
#exec i3


###### Settings for Kali Linux VM  #######
###### start with "xinit (i3|xfce)"  or 'startx ~/.xinitrc "i3"'  #######

## switch control and caps  (host machine swaps it. swap it back here)
setxkbmap -option caps:swapescape

# Here Xfce is kept as default
session=${1:-xfce}

case $session in
    i3|i3wm           ) exec i3;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
