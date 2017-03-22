#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

set -e

sudo apt-get update
sudo apt-get install i3 i3-wm i3blocks -y
sudo apt-get install pulseaudio-utils -y
sudo apt-get install feh -y

if [ ! -f ~/bin/nmcli_dmenu ]; then
	# Install network manager
	curl -o ~/bin/nmcli_dmenu \
		https://raw.githubusercontent.com/firecat53/nmcli-dmenu/master/nmcli_dmenu
	chmod +x ~/bin/nmcli_dmenu
	mkdir -p ~/.config/networkmanager-dmenu
	ln -s `pwd`/networkmanager-dmenu.ini ~/.config/networkmanager-dmenu/config.ini
fi

if [ ! -f ~/bin/mmswitch-monitor ]; then
	# Monitor manager
	ln -s `pwd`/mmswitch-monitor ~/bin/mmswitch-monitor
fi

if [ ! -f ~/bin/mmswitch-sound ]; then
	# Sound manager
	ln -s `pwd`/mmswitch-sound ~/bin/mmswitch-sound
fi

if [ ! -f ~/.config/i3/config ];  then
	mkdir -p ~/.config/i3
	ln -s `pwd`/config ~/.config/i3/config
fi

if [ ! -f ~/bin/i3-tools ]; then
	mkdir -p ~/bin
	ln -s `pwd`/i3-tools ~/bin/i3-tools
fi

if [ ! -f ~/.config/i3/blocks ]; then
	ln -s `pwd`/blocks ~/.config/i3/blocks
fi

if [ ! -f ~/.i3blocks.conf ]; then
	ln -s `pwd`/i3blocks.conf ~/.i3blocks.conf
fi

# tool similar to ctrlp
sudo pip install i3-py
sudo pip install quickswitch-i3

# Install extra fonts...
curl -L -o /tmp/font-awesome.tar.gz https://github.com/FortAwesome/Font-Awesome/archive/v4.6.3.tar.gz
tar xzf /tmp/font-awesome.tar.gz -C /tmp
mkdir -p ~/.fonts
cp /tmp/Font-Awesome-4.6.3/fonts/FontAwesome.otf ~/.fonts

if [ ! -f /usr/share/xsessions/i3.desktop ]; then
	sudo tee /usr/share/xsessions/i3.desktop <<-CONFIG
	[Desktop Entry]
	Name=i3
	Comment=improved dynamic tiling window manager
	Exec=i3
	TryExec=i3
	Type=Application
	X-LightDM-DesktopName=i3
	DesktopNames=i3
	CONFIG
fi
