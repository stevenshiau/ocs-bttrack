#!/bin/bash
# script to make ocs-bttrack
# written by Steven Shiau <steven _at_ nchc org tw>
# 2016/12/25
set -e
#
PKG="ocs-bttrack"
RPMBUILD="${HOME}/rpmbuild/"
SPEC_FILE="$PKG.spec"

# Source function library.
#. /etc/rc.d/init.d/functions

#
[ ! -f "$SPEC_FILE" ] && echo "Can NOT find spec file $SPEC_FILE" && exit 1

#
VER=`grep ^Version $SPEC_FILE |sed -e "s/\t/ /g" -e "s/ \+/ /g" |cut  -d":" -f2 |tr -d " "`
RELEASE=`grep ^Release $SPEC_FILE |sed -e "s/\t/ /g" -e "s/ \+/ /g" |cut  -d":" -f2 |tr -d " "`
echo "VER, RELEASE: $VER, $RELEASE"
#
RVER=$VER-$RELEASE
TARBALL="$PKG-$VER.tar.xz"

build_prefix="${HOME}/rpmbuild/"

#
[ -d $build_prefix/SOURCES/$PKG-$VER ] && rm -rf $build_prefix/SOURCES/$PKG-$VER

# clearn junk
mkdir -p $build_prefix/SOURCES/$PKG-$VER

#
cp $TARBALL $build_prefix/SOURCES/$PKG-$VER
rpmbuild -ba $PKG.spec

[ -d RPMS.drbl-test ] && rm -rf RPMS.drbl-test
mkdir RPMS.drbl-test
cp $mkinitrd_net_pkg $build_prefix/RPMS/$PKG-$RVER.*.rpm $build_prefix/SRPMS/$PKG-$RVER.src.rpm RPMS.drbl-test
