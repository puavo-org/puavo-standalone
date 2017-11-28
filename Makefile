prefix = /usr/local
exec_prefix = $(prefix)
sbindir = $(exec_prefix)/sbin

build:

install-dirs:
	mkdir -p $(DESTDIR)$(sbindir)

install: install-dirs
	install -m 744 -t $(DESTDIR)$(sbindir) puavo-init-standalone

ansible:
	ansible-playbook -i local.inventory standalone.yml

deb:
	rm -rf debian
	cp -a debian.default debian
	dch --newversion "$$(cat VERSION)+build$$(date +%s)" "Built from $$(git rev-parse HEAD)"
	dpkg-buildpackage -us -uc

clean:

