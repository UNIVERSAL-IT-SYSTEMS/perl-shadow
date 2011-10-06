# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Getopt-Long/Getopt-Long-2.380.0.ebuild,v 1.2 2011/10/05 20:20:30 aballier Exp $

EAPI=2

MODULE_AUTHOR=JV
MODULE_VERSION=2.38
inherit perl-module

DESCRIPTION="Advanced handling of command line options"

SLOT="0"
KEYWORDS="alpha amd64 ~arm hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris"
IUSE=""

RDEPEND="virtual/perl-PodParser"
DEPEND="${RDEPEND}"

SRC_TEST=do
