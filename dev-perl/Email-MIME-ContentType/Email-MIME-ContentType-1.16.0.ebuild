# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Email-MIME-ContentType/Email-MIME-ContentType-1.16.0.ebuild,v 1.1 2013/08/15 07:30:16 patrick Exp $

EAPI=4

MODULE_AUTHOR=RJBS
MODULE_VERSION=1.016
inherit perl-module

DESCRIPTION="Parse a MIME Content-Type Header"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~x86 ~sparc-solaris ~x86-solaris"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)"

SRC_TEST="do"
