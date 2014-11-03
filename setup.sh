#!/bin/sh

set -eux

apt-get install -y python-software-properties
apt-add-repository ppa:rquillo/ansible --yes
apt-get update
apt-get install -y ansible git

# If running in Vagrant use the playbook from the mount
if [ -d /vagrant ]; then
    cd /vagrant
fi

# No we don't have the playbook fetch it
if [ ! -f standalone.yml ]; then
    # If already fetched update it
    if [ -d /tmp/puavo-standalone ]; then
        cd /tmp/puavo-standalone
        git pull
    else
        git clone https://github.com/opinsys/puavo-standalone /tmp/puavo-standalone
        cd /tmp/puavo-standalone
    fi
fi

ansible-playbook -i local.inventory standalone.yml
