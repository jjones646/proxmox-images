#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$#" -ne 3 ]; then
    echo "Usage: ./$(basename "$0") <version> <name> <description>"
    exit 1
fi

VERSION="$1"
NAME="$2"
DESCRIPTION="$3"

cat << EOF
Suite: jessie
CacheDir: ../cache
#Source: http://ftp.debian.org/debian SUITE main contrib
#Source: http://ftp.debian.org/debian SUITE-updates main contrib
#Source: http://security.debian.org SUITE/updates main contrib
Architecture: amd64
Name: debian-8.0-standard-joncjones-${VERSION}-${NAME}
Version: 8.0-${VERSION}
Section: system
Maintainer: Jon Jones <jon@joncjones.com>
Infopage: http://pve.proxmox.com/wiki/Debian_Appliance_Builder
Description: Debian 8.0 (standard), JonCJones ${VERSION} (${NAME}) Edition
 ${DESCRIPTION}
EOF

