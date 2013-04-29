# puavo-standalone

Setup Puavo development environment to a single machine.

## Setup


Install puavo-standalone using apt-get:

    echo "deb http://public.opinsys.fi precise main restricted" > /etc/apt/sources.list.d/opinsys.list
    echo "deb-src http://public.opinsys.fi precise main restricted" >> /etc/apt/sources.list.d/opinsys.list
    wget -q http://public.opinsys.fi/key -O - | sudo apt-key add -
    apt-get update
    apt-get install --no-install-recommends puavo-standalone

This will pull in all required packages. Slapd etc.

Init root certificates with topdomain:

    puavo-init-standalone example.net

Add organisation

    puavo-add-new-organisation hogwarts --username albus --password albus --given-name Albus --surname Dumbledore

Create certificates for the new organisation:

    puavo-gen-organisation-certs hogwarts

Next step: [install puavo-users](https://github.com/opinsys/puavo-users/blob/master/doc/STANDALONE.md)
