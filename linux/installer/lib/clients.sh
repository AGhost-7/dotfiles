
# Add spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# dropbawxe
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox \ 
		&& su bash /tmp/elementary-dropbox/install.sh jonathan
