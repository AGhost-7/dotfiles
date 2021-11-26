
export BASH_SILENCE_DEPRECATION_WARNING=1

ssh-server() {
	SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh ssh $@
}

dev() {
	tag=${2:-focal}
	docker run --rm -ti \
		--pull always \
		-v $HOME/.gnupg:/home/aghost-7/.gnupg \
		-v $HOME/workspace:/home/aghost-7/workspace:delegated \
		-v $HOME/.ssh:/home/aghost-7/.ssh \
		-v $HOME/.gitconfig:/home/aghost-7/.gitconfig \
		--add-host "localtest.mindbridge.ai:10.254.254.254" \
		-e DB_CONFIG_URI \
		-e USER_LIST_FILE=/home/aghost-7/workspace/mbai-docker/_data/user_list.json \
		aghost7/$1:$tag
#		-e SSH_AUTH_SOCK=/home/aghost-7/.gnupg \
}

alias vim=nvim
export DB_CONFIG_URI=http://10.254.254.254:8888/db-config.json
