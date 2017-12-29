prefix = /usr/local
exec_prefix = $(prefix)
sbindir = $(exec_prefix)/sbin
sysconfdir = /etc

.PHONY: build
build:

.PHONY: install-dirs
install-dirs:
	mkdir -p $(DESTDIR)$(sbindir)
	mkdir -p $(DESTDIR)$(sysconfdir)/puavo-standalone

.PHONY: install
install: install-dirs
	install -t $(DESTDIR)$(sbindir) puavo-init-standalone
	install -t $(DESTDIR)$(sysconfdir)/puavo-standalone \
		local.inventory standalone.yml

.PHONY: ansible
ansible:
	ansible-playbook -i local.inventory standalone.yml

.PHONY: clean
clean:

.PHONY: deb
deb:
	cp -p debian/changelog.vc debian/changelog 2>/dev/null \
	  || cp -p debian/changelog debian/changelog.vc
	dch --newversion \
	    "$$(cat VERSION)+build$$(date +%s)+$$(git rev-parse HEAD)" \
	    "Built from $$(git rev-parse HEAD)"
	dch --release ''
	dpkg-buildpackage -us -uc
	cp -p debian/changelog.vc debian/changelog

.PHONY: install-build-deps
install-build-deps:
	mk-build-deps --install --tool 'apt-get --yes' --remove debian/control

.PHONY: upload-deb
upload-deb:
	dput puavo ../puavo-standalone_*.changes
