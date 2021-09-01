
if [ -f ~/Private/.accounts ]; then
	. ~/Private/.accounts
fi

export PATH="$PATH:~/bin:$HOME/.local/bin"

export TERM=screen-256color

alias ls='ls --color=auto'
alias snip='xsel -i -b'
alias vim='nvim'

# Mainly for neovim, which uses the xdg spec
export XDG_CONFIG_PATH="$HOME/.config"
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=nvim
export BROWSER=chromium-browser
export WINEPREFIX="$HOME/.wineprefix32"
# And now run powerline for bash

alias todo="nvim $HOME/workspaces/todo.md"
alias nyan='nc -v nyancat.dakko.us 23'

export NVM_DIR="/home/jonathan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export NVIM_TUI_ENABLE_TRUE_COLOR=1

alias node=nodejs

export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true

export PATH="$PATH:$HOME/bin"

if [ -f ~/.poetry/env ]; then
	. ~/.poetry/env
fi


slipway() {
	(cd ~/workspace/slipway && poetry run slipway $@)
}

_compose_shim() {
python3 <<SCRIPT
import os
import yaml
from subprocess import check_call

def build_image(name, build):
	args = ["podman", "build"]
	if type (build) == str:
		args.append(build)
	else:
		if 'dockerfile' in build:
			args.extend(["-f", build['dockerfile']])
		args.append(build['context'])
	check_call(args)

def compose_build(file_path):
	with open(file_path) as file:
		compose_file = yaml.safe_load(file)
		for (name, service) in compose_file['services'].items():
			if 'build' in service:
				build_image(name, service['build'])

compose_build('docker-compose.yml')
SCRIPT
	command docker-compose $@
}

if [ -S /run/user/$UID/podman/podman.sock ]; then
	export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
	export COMPOSE_DOCKER_CLI_BUILD=0
	alias docker-compose='_compose_shim'
fi
