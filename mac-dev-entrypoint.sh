#!/usr/bin/env bash

args="$@"
set -ex

if ! command -v snipsnip > /dev/null ; then
	echo 'snipsnip not found, installing'
	pip install --editable $HOME/workspace/snipsnip
	if command -v xclip > /dev/null; then
		yes | sudo apt-get purge xclip
	fi
	sudo ln -s $HOME/.local/bin/snipsnip /usr/local/bin/xclip
	sudo ln -s $HOME/.local/bin/snipsnip /usr/local/bin/xdg-open
fi


exec tmux new
