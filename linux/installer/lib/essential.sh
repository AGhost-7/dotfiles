#
#	Install shell basics and build tools for system-level libs
#

# Start by installing build dep I'm going to need to install my shizzle
apt-get install wget make build-essential g++ software-properties-common git \
	unzip ca-certificates -y

# Install interactive terminal file manager
apt-get install mc -y

# Install interactive terminal CPU viewer
apt-get install htop -y

apt-get install tree -y

apt-get install dconf-editor -y

# guake <3
apt-get install guake -y
ln -s /usr/share/applications/guake.desktop /etc/xdg/autostart/
