#!/bin/sh

#
# install.sh - Install Script for Sysmon Startup Item
# v0.1 by Morgan Aldridge <morgant@makkintosshu.com>
# v0.2 by Morgan Aldridge <morgant@makkintosshu.com> (now installs to
#	/Library/StartupItems/ instead of /System/Library/StartupItems/.
#

echo "Copying Sysmon to /System/Library/StartupItems/... "
mkdir -p /Library/StartupItems/
cp -rpn Sysmon /Library/StartupItems/
echo "  Done."
echo "Setting ownership on /System/Library/StartupItems/Sysmon/... "
chown -R root:wheel /Library/StartupItems/Sysmon/
echo "  Done."