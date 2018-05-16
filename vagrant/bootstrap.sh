#!/bin/bash
set -eu -o pipefail

# declare variables
CVER="0.3.2"
CREL="constellation-$CVER-ubuntu1604"
GOREL=go1.9.3.linux-amd64.tar.gz
PATH=$PATH:/usr/local/go/bin

# install build deps
add-apt-repository ppa:ethereum/ethereum
apt-get update
apt-get install -y build-essential unzip libdb-dev libleveldb-dev libsodium-dev zlib1g-dev libtinfo-dev solc sysvbanner wrk nodejs-legacy npm

# install constellation
wget -q https://github.com/jpmorganchase/constellation/releases/download/v$CVER/$CREL.tar.xz
tar xfJ $CREL.tar.xz
cp $CREL/constellation-node /usr/local/bin && chmod 0755 /usr/local/bin/constellation-node
rm -rf $CREL
rm $CREL.tar.xz

# install golang
GOREL=go1.9.3.linux-amd64.tar.gz
wget -q https://dl.google.com/go/$GOREL
tar xfz $GOREL
mv go /usr/local/go
rm -f $GOREL
echo 'PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.bashrc

# make/install quorum
git clone https://github.com/jpmorganchase/quorum.git
pushd quorum >/dev/null
git checkout tags/v2.0.1
make all
cp build/bin/geth /usr/local/bin
cp build/bin/bootnode /usr/local/bin
popd >/dev/null

# copy examples
cp -r /vagrant/quorum-network /home/vagrant/quorum-network
chown -R vagrant:vagrant /home/vagrant/quorum /home/vagrant/quorum-network

# done!
echo "✨ The Quorum vagrant instance has been provisioned."
echo "Use 'vagrant ssh' to open a terminal, 'vagrant suspend' to stop the instance, and 'vagrant destroy' to remove it."
