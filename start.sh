#!/bin/bash
#This script updates and launches the Signage System.
#It assumes you have installed NodeJS.
echo Running Updates.
#Hide cursor and taskbar
unclutter -idle 0 &
pkill lxpanel

#Prevent screen sleep
xset s 0
xset -dpms

cd $HOME
if [[ ! -d signage ]] 
then
    mkdir signage
fi
cd signage
echo Getting latest version from Github.
git clone git://github.com/maxmolema/signage tmp
rsync -a tmp/* .
rm -rf tmp
if [[ ! -d content/slides ]] 
then
    mkdir content/slides
fi
pcmanfm --set-wallpaper $HOME/signage/content/bootimg/boot.png
echo Installing latest node packages.
npm install
echo Starting App
npm start
