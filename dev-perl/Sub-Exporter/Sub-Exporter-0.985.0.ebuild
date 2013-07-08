# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Sub-Exporter/Sub-Exporter-0.985.0.ebuild,v 1.2 2013/07/08 09:37:20 vincent Exp $

EAPI=5

MODULE_AUTHOR=RJBS
MODULE_VERSION=0.985
inherit perl-module

DESCRIPTION="A sophisticated exporter for custom-built routines"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

RDEPEND="
	>=dev-perl/Sub-Install-0.920.0
	>=dev-perl/Data-OptList-0.100.0
	>=dev-perl/Params-Util-0.140.0
"
DEPEND="${RDEPEND}"

SRC_TEST=do
