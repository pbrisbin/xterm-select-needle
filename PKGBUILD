# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
#
# Main xterm packaging:
#   Jan de Groot <jgc@archlinux.org> &
#   Alexander Baldeck <alexander@archlinux.org>
#
# select-needle patch:
#   @fmang: original, https://bbs.archlinux.org/viewtopic.php?id=181515
#   @pbrisbin: updated to work with ncurses applications (like mutt)

pkgname=xterm-select-needle
_pkgname=xterm # upstream
pkgver=327
pkgrel=2
pkgdesc="X Terminal Emulator (with select-needle patch)"
arch=('i686' 'x86_64')
url="http://invisible-island.net/xterm/"
license=('custom')
conflicts=('xterm')
depends=('libxft' 'libxaw' 'ncurses' 'xorg-luit' 'xbitmaps' 'libutempter' 'libxkbfile')
source=(ftp://invisible-island.net/${_pkgname}/${_pkgname}-${pkgver}.tgz{,.asc}
        xterm-needle.patch
        LICENSE)
md5sums=('3c32e931adcad44e64e57892e75d9e02'
         'SKIP'
         '6b2cbefc54d5c30642bb95452b8fdd42'
         '10ecc3f8ee91e3189863a172f68282d2')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB') # "Thomas Dickey <dickey@invisible-island.net>"

build() {
  local patch_file=$PWD/xterm-needle.patch
  cd ${_pkgname}-${pkgver}
  patch < "$patch_file"
  ./configure --prefix=/usr \
      --libdir=/etc \
      --mandir=/usr/share/man \
      --with-app-defaults=/usr/share/X11/app-defaults/ \
      --with-x \
      --disable-full-tgetent \
      --disable-imake \
      --enable-ansi-color \
      --enable-88-color \
      --enable-256-color \
      --enable-broken-osc \
      --enable-broken-st \
      --enable-load-vt-fonts \
      --enable-i18n \
      --enable-wide-chars \
      --enable-doublechars \
      --enable-warnings \
      --enable-tcap-query \
      --enable-logging \
      --enable-dabbrev \
      --enable-freetype \
      --enable-luit \
      --enable-mini-luit \
      --enable-narrowproto \
      --enable-exec-xterm \
      --enable-sixel-graphics \
      --with-tty-group=tty \
      --with-utempter
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  chmod 0755 "${pkgdir}/usr/bin/xterm"

  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 "${srcdir}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/${_pkgname}-${pkgver}/{xterm,uxterm}.desktop ${pkgdir}/usr/share/applications/
}
