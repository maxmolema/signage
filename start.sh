#!/bin/bash
#This script updates and launches the Signage System.
#It assumes you have installed NodeJS.
echo Running Updates.
#Hide cursor and taskbar
unclutter -idle 0 &
pkill lxpanel

#Setting Variables
SERIAL="$(cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2)"



#Prevent screen sleep
xset s 0
xset -dpms

#Setting "Getting Version" screen.
if [ ! "$EUID" -ne 0 ]
  then runuser -l  pi -c 'pcmanfm --set-wallpaper /home/pi/signage/content/bootimg/getver.png'
fi

if [ "$EUID" -ne 0 ]
  then pcmanfm --set-wallpaper /home/pi/signage/content/bootimg/getver.png
fi

cd /home/pi
if [[ ! -d /home/pi/signage ]]
then
    mkdir /home/pi/signage
fi
cd signage

sleep 5

echo Getting latest version from Server.
wget -q -O /home/pi/signage/signage.zip sjonhetplatenkanon.online

echo "Unzipping files."
unzip -o -q /home/pi/signage/signage.zip -d /home/pi/signage

rm /home/pi/signage/signage.zip

if [[ ! -d /home/pi/signage/content/slides ]]
then
    mkdir /home/pi/signage/content/slides
fi

if [ ! "$EUID" -ne 0 ]
  then runuser -l  pi -c 'pcmanfm --set-wallpaper /home/pi/signage/content/bootimg/boot.png'
fi

if [ "$EUID" -ne 0 ]
  then pcmanfm --set-wallpaper /home/pi/signage/content/bootimg/boot.png
fi

echo "Downloading Slideshow"
#wget -q -O /home/pi/signage/content/slideshow.pdf https://docs.google.com/presentation/d/1xL1j2-FJiwlRrDP6IQC1QApvD4N1LRq9BYpON1HZ3Q8/export/pdf?id=1xL1j2-FJiwlRrDP6IQC1QApvD4N1LRq9BYpON1HZ3Q8
#curl -L https://docs.google.com/presentation/d/1xL1j2-FJiwlRrDP6IQC1QApvD4N1LRq9BYpON1HZ3Q8/export/pdf?id=1xL1j2-FJiwlRrDP6IQC1QApvD4N1LRq9BYpON1HZ3Q8 > /home/pi/signage/content/slideshow.pdf

echo "Extracting Slides"
#pdftoppm /home/pi/signage/content/slideshow.pdf /home/pi/signage/content/slides/slide -png -r 150

echo Installing latest node packages.
npm install
echo Starting App
npm start
