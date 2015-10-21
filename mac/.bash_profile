vim(){
	mvim -v "$@"
}

. /usr/local/opt/autoenv/activate.sh

export PATH="$PATH:~/envfiles/mac/bin:~/envfiles/common/bin:~/bin:$HOME/workspaces/parsy/bin"

# Powerline's powerline-config script needs to be on the PATH
# for it to work in tmux
export PATH="$PATH:~/Library/Python/2.7/bin"

export LC_ALL="en_US.UTF-8"
export NVM_PATH=~/.nvm
export NODE_ENV=development

source ~/.nvm/nvm.sh
nvm use 0.10.38 > /dev/null

start_dir=`cat ~/.start_dir_bash`
cd "$start_dir"

export CLICOLOR=1
export PS1='[\[\e[0;31m\]\u\[\e[0m\]]:\e[0;34m\]\w\[\e[0m\]\n\$ '

#alias ls='ls -Fa'
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash


