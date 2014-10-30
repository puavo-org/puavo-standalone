#!/bin/sh

set -eu

apt-get install -y python-software-properties
apt-add-repository ppa:rquillo/ansible --yes
apt-get update
apt-get install -y ansible git


if [ ! -f standalone.yml ]; then
    if [ -d /tmp/puavo-standalone ]; then
        cd /tmp/puavo-standalone
        git pull
    else
        git clone https://github.com/opinsys/puavo-standalone /tmp/puavo-standalone
        cd /tmp/puavo-standalone
    fi
fi

ansible-playbook -i local.inventory standalone.yml
