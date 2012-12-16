# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/FLV-AudioExtractor/FLV-AudioExtractor-0.010.0.ebuild,v 1.1 2012/12/12 09:53:30 pinkbyte Exp $

EAPI=5

MODULE_AUTHOR=FVOX
MODULE_VERSION=0.01
inherit perl-module

DESCRIPTION="Extract audio from Flash Videos"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/perl-ExtUtils-MakeMaker"
RDEPEND="dev-perl/Moose"

SRC_TEST="do parallel"