
#
#	Install source code editors
#

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
ln -s `pwd`/../.vimrc ~/.vimrc
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
wget -O /tmp/atom.deb \
	https://github.com/atom/atom/releases/download/v1.0.2/atom-amd64.deb
dpkg -i /tmp/atom.deb

# ---------
# Intellij
# ---------
wget -O /tmp/intellij.tar.gz \
 	https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-14.1.4.tar.gz
tar -C /tmp -zx -f /tmp/intellij.tar.gz
mv idea* idea
/tmp/idea/bin/./idea
