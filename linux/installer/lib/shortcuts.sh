
keybind-settings(){
	gsettings $1 org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$2/ $3 $4
}

keyboard-shortcut(){
	i=$1
	keybind-settings set $i name $2
	keybind-settings set $i binding $3
	keybind-settings set $i command $4
}

keyboard-shortcut 0 'google-chrome-stable' '<Primary><Alt>w' 'google-chrome-stable'
keyboard-shortcut 1 'pantheon-terminal' '<Primary><Alt>t' 'pantheon-terminal'
keyboard-shortcut 2 'pantheon-files' '<Primary><Alt>f' 'pantheon-files'




