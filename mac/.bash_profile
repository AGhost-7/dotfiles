#vim(){
#	mvim -v "$@"
#}

. /usr/local/opt/autoenv/activate.sh

export PATH="$PATH:~/envfiles/mac/bin:~/envfiles/common/bin:~/bin:$HOME/workspaces/parsy/bin:$HOME/vagrant/bin"

# Powerline's powerline-config script needs to be on the PATH
# for it to work in tmux
export PATH="$PATH:~/Library/Python/2.7/bin"

export LC_ALL="en_US.UTF-8"
export NVM_PATH=~/.nvm
export NODE_ENV=development

source ~/.nvm/nvm.sh
#nvm use 0.10.38 > /dev/null

start_dir=`cat ~/.start_dir_bash`
cd "$start_dir"

export CLICOLOR=1
export PS1='[\[\e[0;31m\]\u\[\e[0m\]]:\e[0;34m\]\w\[\e[0m\]\n\$ '

#alias ls='ls -Fa'
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

powerline-daemon -q

#POWERLINE_BASH_CONTNUATION=1
#POWERLINE_BASH_SELECT=1
#. ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/jboudreau/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

test -r /sw/bin/init.sh && . /sw/bin/init.sh

##
# Your previous /Users/jboudreau/.bash_profile file was backed up as /Users/jboudreau/.bash_profile.macports-saved_2016-02-02_at_09:03:14
##

# MacPorts Installer addition on 2016-02-02_at_09:03:14: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

. ~/.auth-env
export XDG_CONFIG_PATH=/Users/jboudreau/.config

alias vim='nvim'
