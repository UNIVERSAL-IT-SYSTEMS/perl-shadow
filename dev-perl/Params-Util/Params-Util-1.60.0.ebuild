# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Params-Util/Params-Util-1.60.0.ebuild,v 1.10 2012/09/09 16:17:34 armin76 Exp $

EAPI=4

MODULE_AUTHOR=ADAMK
MODULE_VERSION=1.06
inherit perl-module

DESCRIPTION="Utility functions to aid in parameter checking"

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~ppc-aix ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""

RDEPEND=">=virtual/perl-Scalar-List-Utils-1.18"
DEPEND="${RDEPEND}"
#	>=virtual/perl-ExtUtils-MakeMaker-6.52
#	>=virtual/perl-ExtUtils-CBuilder-0.27"

SRC_TEST="do"
