.PHONY: clean

build: clean xterm-needle.patch
	makepkg $(MAKEPKG_OPTS)

xterm-needle.patch: xterm/*
	makepkg --nobuild
	cd src && diff -u xterm-327 ../xterm | grep -v '^Only in' > xterm-needle.patch
	updpkgsums

clean:
	$(RM) -rf pkg src *.tgz *.tgz.asc *.pkg.tar.xz
