#!/bin/bash

clear

echo "

BrewZilla Installing......"


echo "


Updating System"
sudo apt-get update && sudo apt-get upgrade -y

echo "


Installing needed packages"
sudo apt-get install python-tk python-numpy arduino-core arduino-mk -y
pip install pyserial


echo  "


Setting up 7" touch screen"

sudo rm -rf LCD-show
git clone https://github.com/goodtft/LCD-show.git
chmod -R 755 LCD-show
cd LCD-show/
sudo ./LCD7B-show 180



echo "


Setting up autorun..."
echo '@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
@xscreensaver -no-splash

@python /home/pi/BrewZilla/brewzilla.py' > /home/pi/.config/lxsession/LXDE-pi/autostart


echo "


Setting up arduino..."
sudo cp 99-arduino.rules /etc/udev/rules.d/


echo "


Flashing Arduino..."
cd ~/BrewZilla && make clean upload

echo "


Done! Rebooting 5 seconds"

sleep 5
sudo reboot



