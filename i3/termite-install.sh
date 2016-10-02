#!/usr/bin/env bash

sudo apt-get update

# Start by installing deps for vte-ng...
sudo apt-get install autoconf libglib2.0-dev gtk-doc-tools

curl -L -o /tmp/vte-ng.tar.gz \
	https://github.com/thestinger/vte-ng/archive/0.46.0.a.tar.gz
tar xvf /tmp/vte-ng.tar.gz -C /tmp
pushd /tmp/vte-ng-0.46.0.a > /dev/null


popd > /dev/null

