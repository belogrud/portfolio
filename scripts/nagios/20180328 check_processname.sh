#
#	Here is an example of how to process arguments of a running script.
#


[root@vm-kafka-stp01p ~]# cat /usr/lib64/nagios/plugins/check_processname.sh
#!/bin/bash
# Paths to commands used in this script.  These may have to be modified to match your system setup.
PGREP=/bin/pgrep

# Nagios return codes
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

# Plugin variable description
PROGNAME=$(basename $0)
RELEASE="Revision 1.1.1"
AUTHOR="(c) 2018 Sergey Belogrud (s.belogrud@tinkoff.ru)"

if [ ! -x $PGREP ]; then
        echo "UNKNOWN: utility pgrep not found or is not executable by the nagios user."
        exit $STATE_UNKNOWN
fi

# Functions plugin usage
print_release() {
    echo "$RELEASE $AUTHOR"
}

print_usage() {
        echo ""
        echo "$PROGNAME $RELEASE - Find process name check script for Nagios"
        echo "This plugin will check process name among list of running processes"
        echo ""
        echo "Usage: $PROGNAME -p process_name"
        echo ""
        echo "-p  Define process name to find it among list of running"
        echo "-h  Show this page"
        echo ""
        echo "Usage: $PROGNAME -p process_name"
        echo "Usage: $PROGNAME --help"
        echo ""
}

# Parse parameters
while [ $# -gt 0 ]; do
    case "$1" in
        -h | --help)
            print_usage
            exit $STATE_OK
            ;;
        -v | --version)
            print_release
            exit $STATE_OK
            ;;
        -p | --procname)
            shift
            PROCESSNAME=$1
            ;;
        *)  echo "Unknown argument: $1"
            print_usage
            exit $STATE_UNKNOWN
            ;;
    esac
    shift
done

# Return
# Remember - one process with a searched process name is this script. It's because its argument contains a searched process name.
if [ $($PGREP -f $PROCESSNAME -c) -gt 1 ]; then
        echo "OK: Process \"${PROCESSNAME}\" is running (found among list of running processes)."
        exit $STATE_OK
else
        echo "CRITICAL: Process \"${PROCESSNAME}\" is not running (not found among list of running processes)."
        exit $STATE_CRITICAL
fi
[root@vm-kafka-stp01p ~]#




[root@vm-kafka-stp01p ~]# /usr/lib64/nagios/plugins/check_processname.sh -p zookeeper
OK: Process "zookeeper" is running (found among list of running processes).
[root@vm-kafka-stp01p ~]#
