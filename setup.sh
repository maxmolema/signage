#!/bin/bash
#This script autostarts the Signage System on boot.

if [ "$EUID" -ne 0 ]
  then echo Run as root
  exit
fi
apt-get install unclutter
sed -i 's,^\(show_trash[ ]*=\).*,\1'0',g' /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
cp signage-autostart.desktop /etc/xdg/autostart

echo Done
