#!/bin/sh

set -eu

sudo apt-get install -y python-software-properties
sudo apt-add-repository ppa:rquillo/ansible --yes
sudo apt-get update
sudo apt-get install -y ansible git

sudo ansible-playbook standalone.yml
