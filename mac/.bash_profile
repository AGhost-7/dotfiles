vim(){
	mvim -v "$@"
}

. /usr/local/opt/autoenv/activate.sh

export PATH="$PATH:~/bin"

export NVM_PATH=~/.nvm
export NODE_ENV=development

source ~/.nvm/nvm.sh
nvm use 0.10.38 > /dev/null

start_dir=`cat ~/.start_dir_bash`
cd "$start_dir"

export CLICOLOR=1
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
#alias ls='ls -Fa'
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash


