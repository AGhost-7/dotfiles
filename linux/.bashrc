export PATH="$PATH:~/bin:$HOME/.local/bin"

# If not specified, I want
export PGDATABASE=template1

export NVM_DIR="/home/jonathan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#export PROMPT_COMMAND='echo -e "\e[?16;0;200c"'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export TERM=screen-256color
export BROWSER=chrome

alias ls='ls --color=auto'
alias snip='xclip -selection clipboard'
alias vim='nvim'

export XDG_CONFIG_PATH="$HOME/.config"

export EDITOR=nvim

