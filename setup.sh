#!/bin/sh

set -eux

# Install apt-add-repository tool
apt-get install -y python-software-properties

# Add Ansible ppa repository and install Ansible
apt-add-repository ppa:rquillo/ansible --yes
apt-get update
apt-get install -y ansible git

# If running in Vagrant use the playbook from the mount
if [ -d /vagrant ]; then
    cd /vagrant
fi

# No we don't have the playbook fetch it
if [ ! -f standalone.yml ]; then
    if [ -d /tmp/puavo-standalone ]; then
        # If already fetched update it
        cd /tmp/puavo-standalone
        git pull
    else
        # Otherwise get the latest rules
        git clone https://github.com/opinsys/puavo-standalone /tmp/puavo-standalone
        cd /tmp/puavo-standalone
    fi
fi

# Finally apply the rules to localhost
ansible-playbook -i local.inventory standalone.yml
