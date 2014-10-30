#!/bin/sh

set -eu

sudo apt-get install -y python-software-properties
sudo apt-add-repository ppa:rquillo/ansible --yes
sudo apt-get update
sudo apt-get install -y ansible git


if [ ! -f standalone.yml ]; then
    git clone https://github.com/opinsys/puavo-standalone /tmp/puavo-standalone
    cd /tmp/puavo-standalone
fi

sudo ansible-playbook standalone.yml
