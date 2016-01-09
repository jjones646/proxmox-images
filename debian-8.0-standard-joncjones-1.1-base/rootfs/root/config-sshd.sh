#!/bin/bash

CONFIG_FILE=/etc/ssh/sshd_config

# backup file first
cp $CONFIG_FILE $CONFIG_FILE".bak"

# set port
if grep "Port" "${CONFIG_FILE}" &>/dev/null; then
    sed -i 's/^Port.*/Port 22/' "${CONFIG_FILE}"
else
    echo "Port 22" >> "${CONFIG_FILE}"
fi

# permit root login via pubkey
if grep "PermitRootLogin" "${CONFIG_FILE}" &>/dev/null; then
    sed -i 's/^PermitRootLogin.*/PermitRootLogin without-password/' "${CONFIG_FILE}"
else
    echo "PermitRootLogin without-password" >> "${CONFIG_FILE}"
fi

# lower the grace time to login
if grep "LoginGraceTime" "${CONFIG_FILE}" &>/dev/null; then
    sed -i 's/^LoginGraceTime.*/LoginGraceTime 30/' "${CONFIG_FILE}"
else
    echo "LoginGraceTime 30" >> "${CONFIG_FILE}"
fi

# disable X11 forwarding
if grep "LoginGraceTime" "${CONFIG_FILE}" &>/dev/null; then
    sed -i 's/^X11Forwarding.*/X11Forwarding no/' "${CONFIG_FILE}"
else
    echo "X11Forwarding no" >> "${CONFIG_FILE}"
fi

# allow password login via local config & management networks
if grep "Match Address " "${CONFIG_FILE}" &>/dev/null; then
    :
else
    echo "Match Address 192.168.128.0/24,192.168.64.0/18" >> "${CONFIG_FILE}"
    echo "    PasswordAuthentication yes" >> "${CONFIG_FILE}"
fi

exit 0

