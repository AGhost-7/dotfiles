
export BASH_SILENCE_DEPRECATION_WARNING=1

ssh-server() {
	SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh ssh s_jboudreau@$1
}

dev() {
	tag=${2:-focal}
		#--pull always \
	docker run --rm -ti \
		-v $HOME/.gnupg:/home/aghost-7/.gnupg \
		-v $HOME/workspace:/home/aghost-7/workspace:delegated \
		-v $HOME/.ssh:/home/aghost-7/.ssh \
		-v $HOME/.gitconfig:/home/aghost-7/.gitconfig \
		-v $HOME/.kube:/home/aghost-7/.kube \
		-v $HOME/.azure:/home/aghost-7/.azure \
		-v $HOME/.docker/run/docker.sock:/run/docker.sock \
		-v $HOME/workspace/slipway/slipway/command_proxy/client.py:/usr/bin/xdg-open \
		-v $HOME/workspace/slipway/slipway/command_proxy/client.py:/usr/bin/xclip \
		-v $HOME/workspace/slipway/slipway/command_proxy/client.py:/usr/bin/docker \
		-v $HOME/workspace/slipway/slipway/command_proxy/client.py:/usr/bin/docker-compose \
		-e "SLIPWAY_COMMAND_PROXY_URL=tcp://host.docker.internal:7272" \
		--add-host "localtest.mindbridge.ai:10.254.254.254" \
		-e "SNIPSNIP_HOST=10.254.254.254" \
		-e DB_CONFIG_URI \
		-e USER_LIST_FILE=/home/aghost-7/workspace/mbai-docker/_data/user_list.json \
		aghost7/$1:$tag
}

alias vim=nvim
export DB_CONFIG_URI=http://10.254.254.254:8888/db-config.json
export email=jonathan.boudreau@mindbridge.ai
export EDITOR=nvim
export PATH="$PATH:$HOME/Library/Python/3.8/bin"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
#cauldron() {
#	local path="$(cd ~/workspace/cauldron; poetry env info --path)"
#	VIRTUAL_ENV="$path" "$path/bin/cauldron" "$@"
#}

slipway() {
	pushd ~/workspace/slipway > /dev/null
	poetry run slipway $@
	local return_code=$?
	popd > /dev/null
	return $return_code
}


if [ -f ~/Private/.accounts ]; then
	. ~/Private/.accounts
fi

#cd () {
#	buildin cd $@
#	if [ -f .env ]; then
#		. .env
#	fi
#}

export VAGRANT_DEFAULT_PROVIDER=vmware_desktop
export VAGRANT_EXPERIMENTAL=disks
export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

