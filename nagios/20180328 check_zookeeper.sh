# /usr/lib64/nagios/plugins/check_zookeeper.sh


#!/bin/bash
# Paths to commands used in this script.  These may have to be modified to match your system setup.
PGREP=/bin/pgrep

# Nagios return codes
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

# Plugin variable description
PROCESSNAME="zookeeper"
AUTHOR="(c) 2018 Sergey Belogrud (s.belogrud@tinkoff.ru)"

if [ ! -x $PGREP ]; then
        echo "UNKNOWN: utility pgrep not found or is not executable by the nagios user."
        exit $STATE_UNKNOWN
fi

$PGREP -f $PROCESSNAME >/dev/null 2>&1
pgrep_exit_code=$?

# Return
        if [ ${pgrep_exit_code} -eq 0 ]; then
                echo "OK: Process \"${PROCESSNAME}\" is running (found among list of running processes)."
                exit $STATE_OK
        else
                echo "CRITICAL: Process \"${PROCESSNAME}\" is not running (not found among list of running processes)."
                exit $STATE_CRITICAL
        fi
