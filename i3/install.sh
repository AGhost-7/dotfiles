#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get instal i3 i3blocks -y
sudo apt-get install pulseaudio-utils amixer -y
sudo apt-get install feh -y

# Install network manager
curl -o ~/bin/nmcli_dmenu \
	https://raw.githubusercontent.com/firecat53/nmcli-dmenu/master/nmcli_dmenu
chmod +x ~/bin/nmcli_dmenu
mkdir -p ~/.config/networkmanager-dmenu
ln -s `pwd`/networkmanager-dmenu.ini ~/.config/networkmanager-dmenu/config.ini

# Monitor manager
ln -s `pwd`/mmswitch-monitor ~/bin/mmswitch-monitor

# Sound manager
ln -s `pwd`/mmswitch-sound ~/bin/mmswitch-sound

# Install command line network manager
#sudo apt-get install wicd-curses -y
#sudo usermod -a -G netdev "$USER"

mkdir -p ~/.config/i3
ln -s `pwd`/i3/config ~/.config/i3
mkdir -p ~/bin
ln -s `pwd`/i3-tools ~/bin/i3-tools
ln -s `pwd`/blocks ~/.config/i3/blocks

# Install extra fonts...
curl -L -o /tmp/font-awesome.tar.gz https://github.com/FortAwesome/Font-Awesome/archive/v4.6.3.tar.gz
tar xzf /tmp/font-awesome.tar.gz -C /tmp
mkdir -p ~/.fonts
cp /tmp/Font-Awesome-4.6.3/fonts/FontAwesome.otf ~/.fonts
