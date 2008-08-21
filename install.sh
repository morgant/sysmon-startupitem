#!/bin/bash

#
# install.sh - Install script for Sysmon StartupItem/launchd job
# v0.1 by Morgan Aldridge <morgant@makkintosshu.com>
# v0.2 by Morgan Aldridge <morgant@makkintosshu.com> (now installs to
#	/Library/StartupItems/ instead of /System/Library/StartupItems/)
# v0.3 by Morgan Aldridge <morgant@makkintosshu.com> (now installs a StartupItem
#   under Panther & Tiger or a launchd plist under Leopard; better condition
#   checks)
#

os=`sysctl -n kern.ostype`
darwin_version=`sysctl -n kern.osrelease | cut -d . -f 1`
dst='/Library'

echo "Checking Darwin/Mac OS X version..."
if [ $os = "Darwin" ]; then
	if [ $darwin_version -eq 7 -o $darwin_version -eq 8 ]; then
		echo "  Running Mac OS X 10.3 (Panther) or 10.4 (Tiger)."
		echo "Installing Sysmon to $dst/StartupItems/..."
		install -cd -m 750 -o root -g wheel Library/StartupItems/Sysmon $dst/StartupItems/
		echo "  Done."
	elif [ $darwin_version -eq 9 ]; then
		echo "  Running Mac OS X 10.5 (Leopard)."
		echo "Installing org.sysmon.sysmond.plist to $dst/LaunchDaemons/..."
		install -cd -m 750 -o root -g wheel Library/LaunchDaemons/org.sysmon.sysmond.plist $dst/LaunchDaemons/
		echo "  Done."
	else
		echo "FATAL ERROR: Not running a supported version of Darwin/Mac OS X. Please see the included README."
	fi
else
	echo "FATAL ERROR: Not running Darwin/Mac OS X. Please see the included README."
fi
