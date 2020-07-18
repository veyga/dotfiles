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

# power savings
# sudo tlp start &
# sudo powertop --auto-tune &

echo "Arch or Kali?"
read targetsystem

if [[ "$targetsystem" == "Arch" ]]; then
  echo "starting Arch with i3"
  setxkbmap -option caps:swapescape # switch control and caps
  #enable touchpad click
  xinput set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Tapping Enabled" 1
  xinput set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Click Method Enabled" 0 1
  xrandr -s 2560x1440  # resolution
  redshift &
  exec i3
else [[ "$targetsystem" == "Kali" ]]; then
  echo "starting Kali with xfce4"
  setxkbmap -option caps:swapescape # switch control and caps
  exec startxfce4
else 
  echo "unknown target system"
fi


