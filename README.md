# puavo-standalone

Set of [Ansible][] rules for a standalone Puavo cloud environment.

These rules will configure following services

  - OpenLDAP with MIT Kerberos
  - PostgreSQL
  - Redis
  - Selenium server with Xvfb (:99) on port 4444
  - Postfix

and following puavo services

  - [puavo-web](https://github.com/opinsys/puavo-users) on port 8081
  - [puavo-ca](https://github.com/opinsys/puavo-ca)
  - [puavo-rest](https://github.com/opinsys/puavo-users/tree/master/rest) on port 9292

These services must be accessesed using the fqdn of the server.

## Postfix

Postfix is configured only for local development only. Any mail sent using it
is saved to `/root/Maildir` in mbox format. A `mutt` client is configured for
the root user to display those.

# Applying the rules

These rules work only on top of a clean Debian 9 (Stretch) installation.
Debian Jessie and Buster might work, but you'll be on your own.

If you use LXC the machine can be created like this

    lxc-create -n puavostandalone -t ubuntu -- --release precise --arch amd64

For localhost

    sudo ansible-playbook -i local.inventory standalone.yml

For remote machines you must create your own inventory file.

If you are lazy you can just do this like [other cool kids](http://curlpipesh.tumblr.com/)

    wget -qO- https://github.com/opinsys/puavo-standalone/raw/master/setup.sh | sudo sh

It will install Ansible, clone this repository and apply the rules for localhost.

# Vagrant

If you use [Vagrant][] just type

    vagrant up

in the repository root to get a vagrant machine with puavo-standalone. You must have [VirtualBox][] installed for this to work.

[Ansible]: http://ansible.com
[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/
