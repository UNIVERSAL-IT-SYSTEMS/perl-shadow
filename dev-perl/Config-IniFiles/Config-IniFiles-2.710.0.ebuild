# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Config-IniFiles/Config-IniFiles-2.710.0.ebuild,v 1.4 2012/05/12 12:51:05 klausman Exp $

EAPI=4

MODULE_AUTHOR=SHLOMIF
MODULE_VERSION=2.71
inherit perl-module

DESCRIPTION="A module for reading .ini-style configuration files"

SLOT="0"
KEYWORDS="alpha amd64 ~ia64 ~ppc ~sparc x86"
IUSE="test"

RDEPEND="
	dev-perl/IO-stringy
	dev-perl/List-MoreUtils
"
DEPEND="${RDEPEND}
	>=virtual/perl-Module-Build-0.36
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)
"

SRC_TEST="do"
