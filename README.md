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

**CAUTION**: The installation script will fail if user "puavo" and/or group "puavo" already exists in the system!

The simplest way is to just fetch the installation script:

    wget https://github.com/puavo-org/puavo-standalone/raw/master/setup.sh

Then inspect it in your favorite editor to make sure there's nothing unruly in it. Once satisfied, execute it:

    sudo sh setup.sh

And wait for the installation to complete. It's not a bad idea to reboot the system afterwards, to make sure everything's in place.
