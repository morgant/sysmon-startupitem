#!/bin/sh

#
# install.sh - Install Script for Sysmon Startup Item
# v0.1 by Morgan Aldridge (morgant@makkintosshu.com)
#

echo "Copying Sysmon to /System/Library/StartupItems/... "
mkdir -p /System/Library/StartupItems/
cp -rpn Sysmon /System/Library/StartupItems/
echo "Done."