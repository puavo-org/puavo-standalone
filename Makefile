prefix = /usr/local
exec_prefix = $(prefix)
sbindir = $(exec_prefix)/sbin

build:

install-dirs:
	mkdir -p $(DESTDIR)$(sbindir)

install: install-dirs
	install -m 744 -t $(DESTDIR)$(sbindir) puavo-init-standalone

clean:

