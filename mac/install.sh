#!/usr/bin/env bash
h-ln() {
	ln -s `pwd`/$1 ~/$1
}
h-ln .bash_profile .bash_profile
h-ln .vimrc .vimrc
h-ln templates templates
h-ln ssh_config .ssh/config
h-ln ../common/.tern-config .tern-config

#ln -s `pwd`.bash_profile ~/.bash_profile
#ln -s .vimrc ~/.vimrc
#ln -s templates ~/templates
#ln -s ssh_config ~/.ssh/config
