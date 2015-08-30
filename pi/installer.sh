
#
# Basic editing shizzle
#

apt-get install build-essential vim

# TODO: install cmake


#git clone https://github.com/vim/vim.git /tmp/vim

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#cp resource/vimrc ~/.vimrc
# pwd is the directory of the file which is sourcing the script
ln -s `pwd`/../.vimrc ~/.vimrc
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py

# Set up the tern completion/static analysis engine
ln -s `pwd`/../../common/.tern-config ~/.tern-config
cd ~/.vim/bundle/tern_for_vim
npm install

#
# Get node installed
#

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

nvm install 0.12.7
nvm use 0.12.7

echo 'nvm use 0.12.7 > /dev/null' > ~/.bashrc 
