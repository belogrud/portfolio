#!/bin/sh

USER=$2

CRONTAB="/var/spool/cron/$USER"

if [ -f "$CRONTAB" ]; then
    # This script exits 0 if the change is via Puppet
    # and has a non-zero exit status if the change happened
    # elsewhere.
    /usr/local/bin/ossec-ar-verify-crontab.pl $CRONTAB
    rc=$?

    if [ "$rc" != "0" ]; then
        logger -t ossec-ar-verify "crontab $USER change outside Puppet"
    fi
fi
