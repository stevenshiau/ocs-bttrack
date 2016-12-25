#!/bin/bash
# generate the ChangeLog.txt and create the tarball

# Settings
PKG="ocs-bttrack"
FILES_DIRS="src"

set -e
#
VER="$(LC_ALL=C head -n 1 $FILES_DIRS/debian/changelog  | grep -i "^${PKG}" | grep -E -o "\(.*\)" | sed -r -e "s/\(//g" -e "s/\)//g" | cut -d"-" -f1)"
[ -z "$VER" ] && echo "No version found in debian/changelog! Program terminated!"
echo "VER: $VER"

td="${PKG}-${VER}"

#
[ -d "$td" ] && rm -rf $td
mkdir -p $td
# Clean stale files in debian
cp -ar $FILES_DIRS/* $td/

#echo $VER > $td/doc/VERSION
tar cJf ${td}.tar.xz --owner=root --group=root $td
rm -rf $td
