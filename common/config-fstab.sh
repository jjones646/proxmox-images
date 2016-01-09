#!/bin/bash

# the entry to add to /etc/fstab
FSTAB_NETSHARE="//nfs1.joncjones.com/netshare /mnt/netshare     cifs    rw,guest,iocharset=utf8,soft,_netdev 0 0"
# a string to check for any previous existence of the entry
FSTAB_NETSHARE_CHECK="com/netshare"

# backup first
cp /etc/fstab{,.bak}

if grep "${FSTAB_NETSHARE_CHECK}" /etc/fstab &>/dev/null; then
    # if not already edited before, append it
    # add line
    sed -i 's#${FSTAB_NETSHARE_CHECK}.*#${FSTAB_NETSHARE}#g' /etc/fstab
    echo "updating 1 entry in /etc/fstab"
else
    # no previous entry exists
    echo "${FSTAB_NETSHARE}" >> /etc/fstab
    echo "adding 1 new entry to /etc/fstab"
fi

# Create directory for mountpoint
mkdir -p /mnt/netshare

# Check and fix symbolic links if necessary
if [ -h /netshare ]; then
    rm /netshare
fi
ln -s /mnt/netshare /netshare

exit 0

