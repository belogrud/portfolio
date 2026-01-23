#!/bin/bash

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

#source /usr/local/greenplum-db/greenplum_path.sh;gpstate -e > /tmp/segstatus.tmp
#source /home/gpadmin/.bashrc && gpstate -e > /tmp/segstatus.tmp

SWITCHED=$(cat /tmp/segstatus.tmp|grep Switched|wc -l)
RESYNC=$(cat /tmp/segstatus.tmp|grep Resynchronization|wc -l)
SEGSTCOUNT=$(cat /tmp/segstatus.tmp|wc -l)

CHECKDATE=$(date -r /tmp/segstatus.tmp +%s)
DIFFDATE=$(date --date "now -900 sec" +%s)

function usage() {
cat << EOF
usage: $0 options

OPTIONS:
   -h      Show this message
EOF

}

while getopts 'hw:c:' OPTION
do
        case $OPTION in
                h )
                        usage
                        exit
                        ;;
                * )
                        usage
                        exit
                        ;;
        esac
done

if [[ $SWITCHED -ne 0 ]]; then
        echo "CRITICAL - rebalance needed;"
        exit $STATE_CRITICAL
elif [[ $RESYNC -ne 0 ]]; then
        echo "WARNING - resync needed;"
        exit $STATE_WARNING
elif  [[ $SEGSTCOUNT -ne 10 ]]; then
        echo "UNKNOWN"
        exit $STATE_UNKNOWN
elif  [[ $DIFFDATE -gt $CHECKDATE ]]; then
        echo "new state unavailable"
        exit $STATE_UNKNOWN
else
        echo "OK - All segments operate normally;"
        exit $STATE_OK
fi
