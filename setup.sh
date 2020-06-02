#!/bin/bash
#This script autostarts the Signage System on boot.

if [ "$EUID" -ne 0 ]
  then echo Run as root
  exit
fi
apt-get install unclutter
gsettings set org.gnome.nautilus.desktop trash-icon-visible false
cp signage-autostart.desktop /etc/xdg/autostart

echo Done
