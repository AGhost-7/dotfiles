
#
#	Database install script
#

if [[ $1 == "postgres" || $1 == "all" || $1 == "" ]]; then

	# Install postgres for the official pg repo to get the latest suported version
	#apt-get install postgresql -y
	echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' > \
			/etc/sources.list.d/pgdg.list

	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
			apt-key add -
	apt-get update
	apt-get upgrade
	apt-get install postgresql-9.3 pgadmin3 -y

	# add my username to the roles so I don't need to `sudo -u postgres` all the time
	sudo -u postgres psql -c "CREATE ROLE $user SUPERUSER LOGIN"
fi

if [[ $1 == "mongodb" || $1 == "mongo" || $1 == "all" || $1 == "" ]]; then

	# install mongodb
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' \
			| tee /etc/apt/sources.list.d/mongodb.list
	apt-get update
	apt-get install -y mongodb-org
	service mongod start
fi


