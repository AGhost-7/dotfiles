#!/usr/bin/env bash

sudo apt-get update
sudo apt-get instal i3 i3blocks -y
sudo apt-get install pulseaudio-utils amixer -y
sudo apt-get install feh -y

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
