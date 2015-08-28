case $1 in
elementary)
	# with the super+w and super+s hotkeys I don't need the dock
	#gsettings set org.pantheon.cerbere monitored-processes \ 
	#		"['wingpanel', 'slingshot-launcher --silent']"
	


	if [[ $2 == "luna" ]];then
		add-apt-repository ppa:mpstark/elementary-tweaks-daily -y
		apt-add-repository ppa:versable/elementary-update -y
		apt-get update		
		apt-get install elementary-tweaks -y
		
		apt-get install elementary-dark-theme elementary-plastico-theme \
				elementary-whit-e-theme elementary-harvey-theme elementary-blue-theme \
				elementary-colors-theme elementary-lion-theme elementary-champagne-theme \
				elementary-milk-theme elementary-emod-icons elementary-elfaenza-icons \
			elementary-nitrux-icons elementary-enumix-utouch-icons \
				elementary-plank-themes -y

	elif [[ $2 == "luna" ]];then

		add-apt-repository ppa:mpstark/elementary-tweaks-daily -y
		add-apt-repository ppa:numix/ppa
		add-apt-repository ppa:moka/stable

		apt-get update
		apt-get install numix-gtk-theme numix-folders -y
		apt-get install elementary-tweaks -y
		apt-get install faba-icon-theme moka-icon-theme
	fi
	;;
esac
