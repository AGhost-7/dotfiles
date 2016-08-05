
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Ubuntu Xenial GNOME 3 Installer script #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

set -e

DEBIAN_FRONTEND=noninteractive

# Start by installing build dep I'm going to need to install my shizzle
sudo apt-get install make build-essential g++ software-properties-common \
	unzip ca-certificates -y

# Install pip dependency manager
sudo apt-get install python-pip -y
pip install --upgrade pip

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

# Per-process network interface monitor
sudo apt-get install iftop -y

# Per-process disk usage monitor
sudo apt-get install iotop -y

# ---------
# Shortcuts
# ---------

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

# ------------------------
# Dev. Env. Virtualization
# ------------------------
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' \
	| sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update

sudo apt-get install docker-engine -y
sudo pip install docker-compose

# ----
# Tmux
#-----

sudo apt-get install tmux -y
ln -s `pwd`/.tmux.conf ~/.tmux.conf

# Default status bar at bottom of tmux is pretty bland and basic.
pip install --user powerline-status

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf \
	https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && \
	mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# ---
# Vim
# ---

# Add ppa and install neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim -y

# YCM will need python support enabled
sudo apt-get install python-pip python-dev
sudo pip install neovim

# Link the init.vim file
mkdir -p ~/.config/nvim
ln -s "$(pwd)"/init.vim ~/.config/nvim/init.vim

# Set up dependency manager! vim-plug is nicer than Vundle thanks to its parallel installation.
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Now install the dependencies
nvim +PlugInstall +qall

# YouCompleteMe needs cmake to compile
sudo apt-get install cmake -y

# And now, compile YouCompleteMe
~/.config/nvim/plugged/YouCompleteMe/install.py

# Install patched fonts for the status line
git clone https://github.com/powerline/fonts.git /tmp/fonts && \
	/tmp/fonts/install.sh

# ------------------
# Account Management
# ------------------
sudo apt-get install ecryptfs-utils -y
ecryptfs-setup-private
ecryptfs-mount-private
touch ~/Private/.accounts
ln -s $HOME/Private/.accounts ~/.accounts
ln -s $HOME/Private/.pypirc ~/.pypirc

# ------
# Gaming
# ------

# Update Mesa Driver
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt-get update
sudo apt-get upgrade -y

# Steam Games!
sudo apt-get install steam -y

# -----------
# GUI Clients
# -----------

# Add spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client -y

# Slack Client
sudo apt-add-repository -y ppa:rael-gc/scudcloud
sudo apt-get update
sudo apt-get install scudcloud -y

# Chromium
sudo apt-get install chromium-browser -y

# Install ghetto-skype
sudo apt-get install libappindicator1 -y
curl -L -o /tmp/ghetto-skype.deb https://github.com/stanfieldr/ghetto-skype/releases/download/v1.2.3/ghetto-skype_1.2.3_amd64.deb
sudo dpkg --install /tmp/ghetto-skype.deb

# Facebook messenger for desktop
curl -L -o /tmp/Messenger.deb https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/v1.4.3/Messenger_linux64.deb
sudo dpkg -i /tmp/Messenger.deb

# Install dropbox
pushd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
popd

