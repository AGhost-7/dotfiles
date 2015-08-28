
#
#	Install source code editors
#

# vim <3
apt-get install vim -y
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#cp resource/vimrc ~/.vimrc
# pwd is the directory of the file which is sourcing the script
ln -s `pwd`/../.vimrc ~/.vimrc
vim +PluginInstall +qall

# meh, prob a good idea
wget -O /tmp/atom.deb \
		https://github.com/atom/atom/releases/download/v1.0.2/atom-amd64.deb
dpkg -i /tmp/atom.deb

# install intellij
wget -O /tmp/intellij.tar.gz \
 		https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-14.1.4.tar.gz
tar -C /tmp -zx -f /tmp/intellij.tar.gz
mv idea* idea
/tmp/idea/bin/./idea
