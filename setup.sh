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

# If we don't have the playbook
if [ ! -f standalone.yml ]; then
    # fetch it to a temp location using git
    if [ ! -d /tmp/puavo-standalone ]; then
        git clone https://github.com/opinsys/puavo-standalone /tmp/puavo-standalone
        cd /tmp/puavo-standalone
    else
        # if already fetched we update it
        cd /tmp/puavo-standalone
        git pull
    fi
fi

# Finally apply the rules to localhost
ansible-playbook -i local.inventory standalone.yml
