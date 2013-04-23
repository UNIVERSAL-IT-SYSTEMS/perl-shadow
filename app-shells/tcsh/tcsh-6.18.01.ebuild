# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-shells/tcsh/tcsh-6.18.01.ebuild,v 1.9 2013/04/23 09:19:26 ago Exp $

EAPI="3"

inherit eutils flag-o-matic autotools prefix

CONFVER="1.9"

DESCRIPTION="Enhanced version of the Berkeley C shell (csh)"
HOMEPAGE="http://www.tcsh.org/"
SRC_URI="ftp://ftp.astron.com/pub/tcsh/${P}.tar.gz
	http://www.gentoo.org/~grobian/distfiles/tcsh-gentoo-patches-r${CONFVER}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm ~hppa ia64 ~m68k ~mips ppc ppc64 ~s390 ~sh ~sparc x86 ~ppc-aix ~x86-fbsd ~x64-freebsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="nls doc"
RESTRICT="test"

# we need gettext because we run autoconf (AM_ICONV)
RDEPEND=">=sys-libs/ncurses-5.1
	virtual/libiconv"
DEPEND="${RDEPEND}
	sys-devel/gettext
	doc? ( dev-lang/perl )"

CONFDIR=${WORKDIR}/tcsh-gentoo-patches-r${CONFVER}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-6.14.00-debian-dircolors.patch # bug #120792
	epatch "${FILESDIR}"/${PN}-6.14-makefile.patch # bug #151951
	epatch "${FILESDIR}"/${PN}-6.14-use-ncurses.patch
	eautoreconf

	# fix gencat usage
	sed -i -e 's/cat \$\^ \$> | \$(GENCAT) \$@/rm -f $@; $(GENCAT) $@ $> $^/' \
		nls/Makefile.in || die

	# unify ECHO behaviour
	echo "#undef ECHO_STYLE" >> config_f.h
	echo "#define ECHO_STYLE      BOTH_ECHO" >> config_f.h

	eprefixify "${CONFDIR}"/*
	# activate the right default PATH
	if [[ -z ${EPREFIX} ]] ; then
		sed -i \
			-e 's/^#MAIN//' -e '/^#PREFIX/d' \
			"${CONFDIR}"/csh.login || die
	else
		sed -i \
			-e 's/^#PREFIX//' -e '/^#MAIN/d' \
			"${CONFDIR}"/csh.login || die
	fi
}

src_configure() {
	# make tcsh look and live along the lines of the prefix
	append-cppflags -D_PATH_DOTCSHRC="'"'"${EPREFIX}/etc/csh.cshrc"'"'"
	append-cppflags -D_PATH_DOTLOGIN="'"'"${EPREFIX}/etc/csh.login"'"'"
	append-cppflags -D_PATH_DOTLOGOUT="'"'"${EPREFIX}/etc/csh.logout"'"'"
	append-cppflags -D_PATH_USRBIN="'"'"${EPREFIX}/usr/bin"'"'"
	append-cppflags -D_PATH_BIN="'"'"${EPREFIX}/bin"'"'"

	econf \
		--prefix="${EPREFIX:-/}" \
		--datarootdir='${prefix}/usr/share' \
		$(use_enable nls) \
		|| die
}

src_install() {
	emake DESTDIR="${D}" install install.man || die

	if use doc ; then
		perl tcsh.man2html tcsh.man || die
		dohtml tcsh.html/*.html
	fi

	insinto /etc
	doins \
		"${CONFDIR}"/csh.cshrc \
		"${CONFDIR}"/csh.login

	dodoc FAQ Fixes NewThings Ported README WishList Y2K

	# bug #119703: add csh -> tcsh symlink
	dosym /bin/tcsh /bin/csh
}
