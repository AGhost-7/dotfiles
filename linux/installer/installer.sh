#!/usr/bin/env bash

#
#    ~~ Installer Script ~~
#
#   note to self: Script is for Elementary OS Freya  which is based on Ubuntu
#		14.04 LTS.
#
#		How to run:
# 	sudo -u jonathan ./installer.sh | tee install.log && echo 'installation complete'
#

if [[ $1 == "" ]]; then
	user=jonathan
else
	user=$1
fi

# update since this is the first time running the ubuntu instance
apt-get update

. lib/essential.sh

. lib/shortcuts.sh

# bin for scripts
mkdir ~/bin

chown $user ~/bin

# add my bashrc file
cp resource/bashrc ~/.bashrc

# Setup filesystem first so that dropbox will sync from the hard drive instead of the ssd
. lib/fs.sh inspiron

. lib/editors.sh

# I think I'll just install postgres for now..
. lib/db.sh postgres

. lib/compilers.sh

. lib/ui.sh elemetary freya
