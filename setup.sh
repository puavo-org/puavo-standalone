#!/bin/sh

set -eu

sudo apt-get update
sudo apt-get install -y python-software-properties
sudo apt-add-repository ppa:rquillo/ansible --yes
sudo apt-get update
sudo apt-get install -y ansible git


if [ ! -f standalone.yml ]; then
    if [ -d /tmp/puavo-standalone ]; then
        cd /tmp/puavo-standalone
        git pull
    else
        git clone https://github.com/opinsys/puavo-standalone /tmp/puavo-standalone
        cd /tmp/puavo-standalone
    fi
fi

sudo ansible-playbook -i local.inventory standalone.yml
