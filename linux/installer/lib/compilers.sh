#
#	Install script for databases
#

# install openjdk8
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get install openjdk-8-jdk -y

# install sbt for scala
echo "deb http://dl.bintray.com/sbt/debian /" | tee -a \
		/etc/apt/sources.list.d/sbt.list
apt-get update
# I need to force it since the repo doesn't provide https
apt-get install sbt -y --force-yes

# Install rust compiler and cargo
curl -sSf https://static.rust-lang.org/rustup.sh | sh

# install *node* \(^0^)/
git clone -b v0.12.7-release https://github.com/joyent/node.git /tmp/node
cd /tmp/node && ./configure && make && make install

# install nvm since its possible that I will use different node version in 
# future projects
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh \
		| bash

# coffeescript
npm install coffee-script -g

# clojure >8)
wget -O /tmp/clojure.zip http://repo1.maven.org/maven2/org/clojure/clojure/1.7.0/clojure-1.7.0.zip
unzip /tmp/clojure.zip && rm /tmp/clojure.zip -f && mv -T /tmp/clojure* /tmp/clojure
mv /tmp/clojure/clojure-1.7.0.jar /usr/local/lib/clojure-1.7.0.jar
cp resource/clojure /usr/local/bin/clojure
chmod +r /usr/local/lib/clojure*.jar

# leinigen clojure build/dependency manager
wget -O /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod +x /usr/local/bin/lein
