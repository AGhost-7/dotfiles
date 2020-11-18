
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

alias slipway='cd ~/workspace/slipway && poetry run slipway'

if [ -S /run/user/$UID/docker.sock ]; then
	export DOCKER_HOST=unix:///run/user/$UID/docker.sock
fi
