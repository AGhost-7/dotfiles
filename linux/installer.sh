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
user=$1
: ${user:="jonathan"}

computer=$2
: ${computer:="inpsiron"}

# update since this is the first time running the ubuntu instance
sudo apt-get update

# ----------------------------------------------------------
#	Install shell basics and build tools for system-level libs
# -----------------------------------------------------------

# . lib/essential.sh

# Start by installing build dep I'm going to need to install my shizzle
sudo apt-get install wget make build-essential g++ software-properties-common git \
	unzip ca-certificates -y

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

# ---------
# Shortcuts
# ---------

# . lib/shortcuts.sh

# Change of workspaces from the command line; used for custom hotcorners/hotkeys
sudo apt-get install wmctrl -y

keybind-settings(){
	gsettings $1 org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$2/ $3 $4
}

keyboard-shortcut(){
	i=$1
	keybind-settings set $i name $2
	keybind-settings set $i binding $3
	keybind-settings set $i command $4
}

keyboard-shortcut 0 'google-chrome-stable' '<Primary><Alt>w' 'google-chrome-stable'
keyboard-shortcut 1 'pantheon-terminal' '<Primary><Alt>t' 'pantheon-terminal'
keyboard-shortcut 2 'pantheon-files' '<Primary><Alt>f' 'pantheon-files'

# Setup switch-workspace for hotcorners
sudo apt-get install wmctrl
ln -s `pwd`/bin/switch-workspace ~/bin/switch-workspace

# ------------------------
# Setup File Sytem & Links
# ------------------------

# bin for scripts
mkdir ~/bin
ln -s `pwd`/.bashrc ~/.bashrc

#chown $user ~/bin

# add my bashrc file
#cp resource/bashrc ~/.bashrc

# Setup filesystem first so that dropbox will sync from the hard drive instead of the ssd
#. lib/fs.sh inspiron

case $computer in
inspiron)
	
	# automount my storage partition
	sudo mkdir /media/storage
	sudo cp /etc/fstab /etc/fstab.backup
	fsDrive=sudo blkid | grep 'dev/sda2' | grep -Eo 'UUID="[A-Za-z0-9-]+"' \
		| grep -Eo '"[A-Za-z0-9-]+"' | grep -Eo '[A-Za-z0-9-]+'
	sudo echo "$fsDrive    /media/storage   ext4     defaults   0   0" >> /etc/fstab

	# I still need to mount the drive since I think I'll need to reset before the 
	# changes to the file take effect.
	sudo mount -t ext4 /dev/sda2 /media/storage

	# link back stuff on my terabyte drive to my home folder.
	function relink(){
		rm -r ~/$1
		ln -s /media/storage/$1 ~/$1
	}
	relink Downloads
	relink Pictures
	relink Videos
	relink Dropbox
	relink Documents
	relink Music
	mkdir workspaces
;;
esac

# ----
# Tmux
#-----

# xclip is needed for yank plugin
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

# I think I'll just install postgres for now..
#. lib/db.sh postgres
# Install postgres for the official pg repo to get the latest suported version
#apt-get install postgresql -y
sudo echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' \
	| sudo tee /etc/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
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
sudo apt-get update
# I need to force it since the repo doesn't provide https
sudo apt-get install sbt -y --force-yes

# Install rust compiler and cargo
curl -sSf https://static.rust-lang.org/rustup.sh | sh

# install *node* \(^0^)/
git clone -b v0.12.7-release https://github.com/joyent/node.git /tmp/node
cd /tmp/node && ./configure && make && sudo make install

# install nvm since its possible that I will use different node version in 
# future projects
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

# coffeescript
sudo npm install coffee-script -g

# clojure >8)
wget -O /tmp/clojure.zip http://repo1.maven.org/maven2/org/clojure/clojure/1.7.0/clojure-1.7.0.zip
unzip /tmp/clojure.zip && rm /tmp/clojure.zip -f && mv -T /tmp/clojure* /tmp/clojure
sudo mv /tmp/clojure/clojure-1.7.0.jar /usr/local/lib/clojure-1.7.0.jar
sudo cp resource/clojure /usr/local/bin/clojure
chmod +r /usr/local/lib/clojure*.jar

# link for repl
ln -s `pwd`/bin/clojure ~/bin/clojure

# leinigen clojure build/dependency manager
sudo wget -O /usr/local/bin/lein \
	https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo chmod +x /usr/local/bin/lein
#. lib/compilers.sh

# ---------------------
# User Interface Tweaks
# ---------------------

#. lib/ui.sh elemetary freya

sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily -y
sudo add-apt-repository ppa:numix/ppa
sudo add-apt-repository ppa:moka/stable

sudo apt-get update
sudo apt-get install numix-gtk-theme numix-folders -y
sudo apt-get install elementary-tweaks -y
sudo apt-get install faba-icon-theme moka-icon-theme

# -----------
# GUI Clients
# -----------

# Add spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# dropbawxe
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox 
bash /tmp/elementary-dropbox/install.sh

# -------
# Vim <3
# -------

# Since I need to have "+ruby" compilation options in Vim of installed, I'm
# to have to compile the thing from source.

# First, remove current vim since it usually comes bundled with Ubuntu distros.
apt-get remove vim vim-runtime gvim

# Couple of dependencies for compiling this one, especially since I want some
# of the extras enabled.
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev cmake

git clone https://github.com/vim/vim.git /tmp/vim
cd /tmp/vim
# I need Python support for YouCompleteMe, and Ruby support for Ensime.
./configure --with-features=huge \
	--enable-multibyte \
	--enable-rubyinterp \
	--enable-pythoninterp \
	--with-python-config-dir=/usr/lib/python2.7/config \
	--enable-perlinterp \
	--enable-luainterp \
	--enable-gui=gtk2 --enable-cscope --prefix=/usr

sudo make install

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#cp resource/vimrc ~/.vimrc
# pwd is the directory of the file which is sourcing the script
ln -s `pwd`/.vimrc ~/.vimrc
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py
# TODO: Add ensime to installer
sudo gem install websocket-eventmachine-client

# Set up the tern completion/static analysis engine
ln -s `pwd`/../../common/.tern-config ~/.tern-config
cd ~/.vim/bundle/tern_for_vim
npm install

# -----
# Atom
# -----
#wget -O /tmp/atom.deb \
#	https://github.com/atom/atom/releases/download/v1.0.2/atom-amd64.deb
#dpkg -i /tmp/atom.deb

# ---------
# Intellij
# ---------
wget -O /tmp/intellij.tar.gz \
 	https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-14.1.4.tar.gz
tar -C /tmp -zx -f /tmp/intellij.tar.gz
mv idea* idea
/tmp/idea/bin/./idea
