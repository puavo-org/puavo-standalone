#!/bin/sh

set -eu

apt-get install -y python-software-properties
apt-add-repository ppa:rquillo/ansible --yes
apt-get update
# OpenPGP data is no where to be found. Workaround with --force-yes for now
apt-get install -y --force-yes ansible git


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
