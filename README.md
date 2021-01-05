# puavo-standalone

Set of [Ansible](https://www.ansible.com/) rules for a standalone Puavo cloud environment, for development and testing.

These rules will configure the following services:

  - OpenLDAP with MIT Kerberos
  - PostgreSQL
  - Redis
  - Selenium server with Xvfb (:99) on port 4444
  - Postfix

and following puavo services

  - [puavo-web](https://github.com/puavo-org/puavo-web) on port 8081
  - [puavo-ca](https://github.com/puavo-org/puavo-ca)
  - [puavo-rest](https://github.com/puavo-org/puavo-web/tree/master/rest) on port 9292

These services must be accessesed using the FQDN of the server.

## Postfix

Postfix is configured only for local development only. Any mail sent using it is saved to `/root/Maildir` in mbox format. A `mutt` client is configured for the root user to display those.

# Applying the rules

These rules work only on top of a clean Debian 10 (Buster) installation. The upcoming Debian Bullseye might work, but as of January 2021, it is not yet officially supported. Older Debian versions and other Linux distributions are not supported at all.

The simplest way is to just fetch the installation script:

    wget https://github.com/puavo-org/puavo-standalone/raw/master/setup.sh

Then inspect it in your favorite editor to make sure there's nothing unruly in it. Once satisfied, execute it:

    sudo sh setup.sh

And wait for the installation to complete. It's not a bad idea to reboot the system afterwards, to make sure everything's in place.

## LXC/Vagrant

**The LXC and Vagrant installations are not currently supported. The relevant files exist, but they have not been updated or tested in a _very_ long time. They might nor might not work.**

If you use LXC the machine can be created like this

    lxc-create -n puavostandalone -t ubuntu -- --release precise --arch amd64

For localhost

    sudo ansible-playbook -i local.inventory standalone.yml

For remote machines you must create your own inventory file.

If you use [Vagrant](https://www.vagrantup.com/) just type

    vagrant up

in the repository root to get a vagrant machine with puavo-standalone. You must have [VirtualBox](https://www.virtualbox.org/) installed for this to work.
