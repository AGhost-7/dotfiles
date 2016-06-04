#!/usr/bin/env bash

#
#    ~~ Installer Script ~~
#
#   note to self: Script is for Elementary OS Freya  which is based on Ubuntu
#		14.04 LTS.
#
#		How to run:
# 	./installer.sh | tee install.log && echo 'installation complete'
#

# Install Script Parameters
#user=$1
#: ${user:="jonathan"}

#computer=$2
#: ${computer:="inpsiron"}

# update since this is the first time running the ubuntu instance
sudo apt-get update

# ----------------------------------------------------------
#	Install shell basics and build tools for system-level libs
# -----------------------------------------------------------

# . lib/essential.sh

# Start by installing build dep I'm going to need to install my shizzle
sudo apt-get install wget make build-essential g++ software-properties-common \
	unzip ca-certificates -y

# Install pip dependency manager
sudo apt-get install python-pip -y

# Install interactive terminal file manager
sudo apt-get install mc -y

# Install interactive terminal CPU viewer
sudo apt-get install htop -y

# handy for viewing the directory structure from the command line
sudo apt-get install tree -y

# For modifying some of the system configurations
sudo apt-get install dconf-editor -y

# guake
sudo apt-get install guake -y
ln -s /usr/share/applications/guake.desktop /etc/xdg/autostart/

# Command line clipboard utility
sudo apt-get install xclip -y

# OMG CURL
sudo apt-get install curl -y
# ---------
# Shortcuts
# ---------

# . lib/shortcuts.sh

# Change of workspaces from the command line; used for custom hotcorners/hotkeys
#sudo apt-get install wmctrl -y

#keybind-settings(){
#	gsettings $1 org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$2/ $3 $4
#}
#
#keyboard-shortcut(){
#	i=$1
#	keybind-settings set $i name $2
#	keybind-settings set $i binding $3
#	keybind-settings set $i command $4
#}
#
#keyboard-shortcut 0 'google-chrome-stable' '<Primary><Alt>w' 'google-chrome-stable'
#keyboard-shortcut 1 'pantheon-terminal' '<Primary><Alt>t' 'pantheon-terminal'
#keyboard-shortcut 2 'pantheon-files' '<Primary><Alt>f' 'pantheon-files'
#
## Setup switch-workspace for hotcorners
#sudo apt-get install wmctrl
#ln -s `pwd`/bin/switch-workspace ~/bin/switch-workspace

# alt-tab will only work with windows in current workspace (gnome 3)
dconf write /org/gnome/shell/app-switcher/current-workspace-only 'true'

# ------------------------
# Setup File Sytem & Links
# ------------------------

# bin for scripts
mkdir ~/bin
rm ~/.bashrc
ln -s `pwd`/.bashrc ~/.bashrc
. ~/.bashrc


# Setup filesystem first so that dropbox will sync from the hard drive instead of the ssd
#. lib/fs.sh inspiron

#case $computer in
#inspiron)
#	
#	# automount my storage partition
#	sudo mkdir /media/storage
#	sudo cp /etc/fstab /etc/fstab.backup
#	fsDrive=sudo blkid | grep 'dev/sda2' | grep -Eo 'UUID="[A-Za-z0-9-]+"' \
#		| grep -Eo '"[A-Za-z0-9-]+"' | grep -Eo '[A-Za-z0-9-]+'
#	sudo echo "$fsDrive    /media/storage   ext4     defaults   0   0" >> /etc/fstab
#
#	# I still need to mount the drive since I think I'll need to reset before the 
#	# changes to the file take effect.
#	sudo mount -t ext4 /dev/sda2 /media/storage
#
#	# link back stuff on my terabyte drive to my home folder.
#	function relink(){
#		rm -r ~/$1
#		ln -s /media/storage/$1 ~/$1
#	}
#	relink Downloads
#	relink Pictures
#	relink Videos
#	relink Dropbox
#	relink Documents
#	relink Music
#	mkdir workspaces
#;;
#esac

# ----
# Tmux
#-----

# get latest version to prevent random logs on startup.
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install tmux xclip
ln -s `pwd`/.tmux.conf ~/.tmux.conf

# Default status bar at bottom of tmux is pretty bland and basic.
pip install --user powerline-status

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf \
	https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && \
	mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# now install tmux-yank
mkdir ~/.tmux
git clone https://github.com/tmux-plugins/tmux-yank ~/.tmux/tmux-yank

# -----------------
# Install Databases
# -----------------

# Postgresql!
sudo apt-get install postgresql-9.3 pgadmin3 -y

# add my username to the roles so I don't need to `sudo -u postgres` all the time
sudo -u postgres psql -c "CREATE ROLE $user SUPERUSER LOGIN"

# install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' \
		| sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start

# -------------------------
#	Compilers and Build Tools
# -------------------------

# install openjdk8
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y

# install sbt for scala
echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt -y

# Install rust compiler and cargo
#curl -sSf https://static.rust-lang.org/rustup.sh | sh

# install *node* \(^0^)/
#git clone -b v0.12.7-release https://github.com/joyent/node.git /tmp/node
#cd /tmp/node && ./configure && make && sudo make install

# install nvm since its possible that I will use different node version in 
# future projects
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

# Make it so that nodejs 4.2 is loaded by default.
. $HOME/.nvm/nvm.sh
nvm install 4.2
nvm alias default 4.2

# coffeescript
npm install coffee-script -g

# leinigen clojure build/dependency manager
sudo wget -O /usr/local/bin/lein \
	https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo chmod +x /usr/local/bin/lein

# ---------------------
# User Interface Tweaks
# ---------------------

#. lib/ui.sh elemetary freya

#sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily -y
#sudo add-apt-repository ppa:numix/ppa
#sudo add-apt-repository ppa:moka/stable
#
#sudo apt-get update
#sudo apt-get install numix-gtk-theme numix-folders -y
#sudo apt-get install elementary-tweaks -y
#sudo apt-get install faba-icon-theme moka-icon-theme

# -----------
# GUI Clients
# -----------

# Add spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client -y

# dropbawxe
#git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox 
#bash /tmp/elementary-dropbox/install.sh

# Slack Client
sudo apt-add-repository -y ppa:rael-gc/scudcloud
sudo apt-get update
sudo apt-get install scudcloud -y

# -------
# Vim <3
# -------
# Add ppa and install neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim -y

# Tern and YCM will need python support enabled
sudo apt-get install python-pip python-dev -y
sudo pip install neovim

# Link the init.vim file
mkdir -p ~/.config/nvim
ln -s `pwd`/init.vim ~/.config/nvim/init.vim
ln -s `pwd`/plugins.vim ~/.config/nvim/plugins.vim

# Set up dependency manager! vim-plug is nicer than Vundle thanks to its parallel installation.
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Now install the dependencies
nvim +PlugInstall +qall

# Install linters globally so the plugins can use them
npm install -g jscs jshint

# Link the tern config file to synchronize project
ln -s `pwd`/../../common/.tern-config ~/.tern-config

# YouCompleteMe needs cmake to compile
sudo apt-get install cmake -y

# And now, compile YouCompleteMe
~/.config/nvim/plugged/YouCompleteMe/install.py --tern-completer

# Install patched fonts for the status line
git clone https://github.com/powerline/fonts.git /tmp/fonts && \
	/tmp/fonts/install.sh


