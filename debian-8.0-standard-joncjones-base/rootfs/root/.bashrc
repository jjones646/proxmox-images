#!/bin/bash

#===========================================================
# Description:  Auto-updating script for network profiles.
# Author:       Jonathan Jones
# Version:      1.1
# Date:         Jan. 07, 2016
# Notes:        
#===========================================================

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

SUBSH_PID=

netcheck ()
{
    SUBSH_PID=$!
    echo "$(readlink -m /netshare/net-common)"
}

copycheck ()
{
    SUBSH_PID=$!
    if [ -r "$NETSHARE" ]; then
        echo "1"
        exit 0
    else
        exit 1
    fi
}

ctrl_c ()
{
    if [ "$SUBSH_PID" ]; then
        kill -s SIGTERM $SUBSH_PID
    fi
    return $?
}

# Trap Ctrl-C interrupt
trap ctrl_c SIGINT

# find the full canonical path to the netshare common
# directory, the path does not have to exist on the system
export NETSHARE="$(netcheck)"
SUBSH_PID=

CAN_COPY="$(copycheck)"
SUBSH_PID=

# update our local copy of the synced network env setup
#if [ -r "$NETSHARE" ]; then
if [ "$CAN_COPY" ]; then
    rsync --timeout=2 -arub $NETSHARE/ $HOME/.net-common
fi

# source the synced network files
. $HOME/.net-common/.bashrc

# source local user's system-specific bashrc file if it exists
if [ -e "$HOME/.bashrc.custom" ]; then
    . $HOME/.bashrc.custom
fi

