
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
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--color=light,hl:12,hl+:15,info:10,bg+:4'
