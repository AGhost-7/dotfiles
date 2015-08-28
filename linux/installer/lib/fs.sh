#
#	File system setup, create links and automount
#

case $1 in
inspiron)
	
	# automount my storage partition
	mkdir /media/storage
	sudo cp /etc/fstab /etc/fstab.backup
	fsDrive=sudo blkid | grep 'dev/sda2' | grep -Eo 'UUID="[A-Za-z0-9-]+"' \
		| grep -Eo '"[A-Za-z0-9-]+"' | grep -Eo '[A-Za-z0-9-]+'
	echo "$fsDrive    /media/storage   ext4     defaults   0   0" >> /etc/fstab

	# I still need to mount the drive since I think I'll need to reset before the 
	# changes to the file take effect.
	sudo mount -t ext4 /dev/sda2 /media/storage

	# link back stuff on my terabyte drive to my home folder.
	function relink(){
		rm -r ~/$1
		ln -s /media/storage/$1 ~/$1
	}
	relink Downloads
	relink Pictures
	relink Videos
	relink Dropbox
	relink Documents
	relink Music
	mkdir workspaces
;;
esac

