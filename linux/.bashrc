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

export NODE_ENV=development
export PATH="$PATH:$HOME/.cargo/bin"
export WINEPREFIX="$HOME/.wineprefix32"
export DOCKED_EMAIL="jboudreau@i-sight.com"
export DOCKED_GH_USERNAME="AGhost-7"
export DOCKED_WORKSPACE="~/workspaces/work-test/workspace"
export DOCKED_PATH="~/workspaces/vagrant-work/builds/docked"
# And now run powerline for bash
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--color=light,hl:12,hl+:15,info:10,bg+:4'
