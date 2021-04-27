#/bin/bash

if [ "$EUID" -ne 0 ]
  then echo Run as root
  exit
fi
cd /home/pi

if [[ ! -d signage ]] 
then
    echo "Creating Directory /home/pi/signage"
    mkdir signage
fi

cd signage

while true; do
    read -p "Do you want to install NodeJS? Yes(y) or No(n)" yn
    case $yn in
        [Yy]* ) echo "installing latest version of Node.JS"; curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -; sudo apt-get install -y nodejs; break;;
        [Nn]* ) break;;
        * ) echo "Please answer with Yes(y) or No(n)";;
    esac
done

apt-get install unclutter
sed -i 's,^\(show_trash[ ]*=\).*,\1'0',g' /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf



echo "Downloading files from server."
wget -q -O signage.zip sjonhetplatenkanon.online

echo "Unzipping files."
unzip -o -q signage.zip

echo "Setting Permissions"
chmod -R 777 .

echo "Removing install files."
rm signage.zip

while true; do
    read -p "Do you want the system to start at boot? Yes(y) or No(n)" yn
    case $yn in
        [Yy]* ) cp /home/pi/signage/signage-autostart.desktop /etc/xdg/autostart; break;;
        [Nn]* ) break;;
        * ) echo "Please answer with Yes(y) or No(n)";;
    esac
done

echo Done!

