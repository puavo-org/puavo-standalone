#!/bin/sh

set -eu

sudo apt-get install -y python-software-properties git
sudo apt-add-repository ppa:rquillo/ansible --yes
sudo apt-get update
sudo apt-get install -y ansible python-apt git

sudo ansible-playbook standalone.yml
