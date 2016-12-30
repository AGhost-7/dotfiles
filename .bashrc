
if [ -f ~/Private/.accounts ]; then
	. ~/Private/.accounts
fi

export PATH="$PATH:~/bin:$HOME/.local/bin"

export TERM=screen-256color
export BROWSER=chrome

alias ls='ls --color=auto'
alias snip='xclip -selection clipboard'
alias vim='nvim'

# Mainly for neovim, which uses the xdg spec
export XDG_CONFIG_PATH="$HOME/.config"

export EDITOR=nvim
export BROWSER=chromium-browser
export WINEPREFIX="$HOME/.wineprefix32"
# And now run powerline for bash

alias todo="nvim $HOME/workspaces/todo.md"
alias nyan='nc -v nyancat.dakko.us 23'

export NVM_DIR="/home/jonathan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
