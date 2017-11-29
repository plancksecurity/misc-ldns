#!/bin/sh

#  configure.sh
#  ldns-xcode
#
#  Created by Dirk Zimmermann on 29.11.17.
#  Copyright © 2017 pEp Security S.A. All rights reserved.

#
# Sample invocation:
# PROJECT_DIR=.. sh configure.sh
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
PATH=$PATH:/opt/local/bin

LDNS_BASE=$PROJECT_DIR/../..

# Make sure the last part is correct
SDK=$LDNS_BASE/../OpenSSL-for-iPhone/bin/iPhoneSimulator11.1-x86_64.sdk

pushd $LDNS_BASE
git submodule update --init
glibtoolize -ci
autoreconf -fi
autoreconf -fi
./configure --disable-dane --disable-dane-verify --disable-dane-ta-usage --with-ssl=$SKD
popd
mkdir -p $PROJECT_DIR/ldns
mv $LDNS_BASE/ldns/config.h $PROJECT_DIR/ldns
