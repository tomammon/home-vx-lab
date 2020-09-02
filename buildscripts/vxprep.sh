#!/bin/bash

if [ -z $1 ]
then
    echo "Hostname is required. Exiting."
    exit 1
fi

net add hostname $1
net commit

echo Add name entry for saltmaster
echo "192.168.122.1  salt" >> /etc/hosts

echo Preparing apt sources for minion installation
cat <<EOT >> /etc/apt/sources.list
deb     http://deb.debian.org/debian buster main
deb     http://deb.debian.org/debian buster-updates main
deb     http://security.debian.org buster/updates main
deb     http://deb.debian.org/debian buster-backports main
EOT

echo Installing salt-minion
# instructions at https://repo.saltstack.com/#debian
wget -O - https://repo.saltstack.com/py3/debian/10/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/py3/debian/10/amd64/latest buster main" > /etc/apt/sources.list.d/saltstack.list
apt-get update
apt-get install -y salt-minion

echo Moving salt-minion to the mgmt vrf
systemctl stop salt-minion
systemctl disable salt-minion
systemctl enable salt-minion@mgmt
systemctl start salt-minion@mgmt

