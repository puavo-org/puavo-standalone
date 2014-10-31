# puavo-standalone

Set of [Ansible][] rules for a standalone Puavo cloud environment.

These rules will configure following services

  - OpenLDAP with MIT Kerberos
  - PostgreSQL 9.3
  - Redis
  - Selenium server with Xvbf (:99) on port 4444

and following puavo services

  - [puavo-web](https://github.com/opinsys/puavo-users) on port 8081
  - [puavo-ca](https://github.com/opinsys/puavo-ca)
  - [puavo-rest](https://github.com/opinsys/puavo-users/tree/master/rest) on port 9292
  - [puavo-ticket](https://github.com/opinsys/puavo-ticket) on port 3002

These services must be accessesed using the fqdn of the server.

# Applying the rules

The rules work only on top of a clean Ubuntu 12.04 LTS (Precise Pangolin)
installation.

For localhost

    sudo ansible-playbook -i local.inventory standalone.yml

For remote machines you must create your own inventory file.

You are lazy you can just do this

    wget -qO - https://github.com/opinsys/puavo-standalone/raw/master/setup.sh | sudo sh

It will install Ansible, clone this repository and apply the rules for localhost.


[Ansible]: http://ansible.com

