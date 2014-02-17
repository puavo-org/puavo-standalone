# puavo-standalone

Setup Puavo environment (LDAP&Certificates) to a single machine.

Please use a fresh dedicated Ubuntu Precise 12.04 installation.

## Setup

Setup our apt sources

    cat >/etc/apt/sources.list.d/opinsys.list<<EOF
    deb http://archive.opinsys.fi/git-master precise main
    deb http://archive.opinsys.fi/slapd-old precise main
    EOF


Install puavo-standalone using apt-get:

    apt-get update
    apt-get install --no-install-recommends puavo-standalone

This will pull in all required packages. Slapd etc.

Init root certificates for topdomain:

    puavo-init-standalone --unsafe-passwords example.net

For production setup you will want to drop the `--unsafe-passwords` switch.

Then might want to install [Puavo web interface](https://github.com/opinsys/puavo-users/blob/master/doc/STANDALONE.md)
