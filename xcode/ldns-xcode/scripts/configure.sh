#!/bin/sh

#  configure.sh
#  ldns-xcode
#
#  Created by Dirk Zimmermann on 29.11.17.
#  Copyright © 2017 pEp Security S.A. All rights reserved.

#
# Sample invocation:
# PROJECT_DIR=.. sh configure.sh # from the script directory
# PROJECT_DIR=xcode/ldns-xcode/ sh xcode/ldns-xcode/scripts/configure.sh # from the ldns base
#

#
# PROJECT_DIR must be set correctly, to the root of the xcode project.
# Set this manually if you don't use this script from xcode.
#

#
# Macport dependencies:
#
# sudo port install autoconf
# sudo port install libtool
# sudo port install automake
#

# macports must be in PATH
#PATH=$PATH:/opt/local/bin

LDNS_BASE=$PROJECT_DIR/../..

sdks=( ../OpenSSL-for-iPhone/bin/iPhoneSimulator*-x86_64.sdk )
SDK="${sdks[${#sdks[@]}-1]}"
echo Using OpenSSL at $SDK

pushd $LDNS_BASE
git submodule update --init
glibtoolize -ci
autoreconf -fi
./configure --disable-dane --disable-dane-verify --disable-dane-ta-usage --with-ssl=$SDK
popd
