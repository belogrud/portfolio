[bsv@ds-pr-onlapp01 ~]$ cat /usr/lib64/nagios/plugins/check_core.sh
#!/bin/bash

AUTHOR="(c) 2018 Sergey Belogrud (s.belogrud@tinkoff.ru)"

# Paths to commands used in this script.  These may have to be modified to match your system setup.
UTILITY1=/bin/find
UTILITY2=/bin/sed


# Nagios return codes
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

# Plugin variables
PATHTOFOLDER="/home/online/"
FILENAME="core.*"

if [ ! -x $UTILITY1 -o ! -x $UTILITY2 ]; then
        echo "UNKNOWN: utility ${UTILITY1} or ${UTILITY2} not found or not executable by nagios user."
        exit $STATE_UNKNOWN
fi

utility_output=$($UTILITY1 $PATHTOFOLDER -name $FILENAME -printf '%p ' | $UTILITY2 -e 's/ $//')

# Return
        if [ -z "${utility_output}" ]; then
                echo "OK: Files \"${PATHTOFOLDER}${FILENAME}\" not found."
                exit $STATE_OK
        else
                echo "CRITICAL: Found \"${utility_output}\" in \"${PATHTOFOLDER}\"."
                exit $STATE_CRITICAL
        fi

[bsv@ds-pr-onlapp01 ~]$



#
#	Here is a modification of this script.

[root@ds-pr-onlapp01 plugins]# cat ./check_core_files_mod.sh
#!/bin/bash

AUTHOR="(c) 2018 Sergey Belogrud (s.belogrud@tinkoff.ru)"

# Paths to commands used in this script.  These may have to be modified to match your system setup.
UTILITY1=/bin/find

# Nagios return codes
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

# Plugin variables
PATHTOFOLDER="/home/online/"
FILENAME="core.*"

if [ ! -x $UTILITY1 ]; then
        echo "UNKNOWN: utility ${UTILITY1} not found or not executable by nagios user."
        exit $STATE_UNKNOWN
fi

utility_output=$($UTILITY1 $PATHTOFOLDER -name $FILENAME | wc -l )

# Return
        if [ "${utility_output}" == "0" ]; then
                echo "OK: Files \"${PATHTOFOLDER}${FILENAME}\" not found."
                exit $STATE_OK
        elif [ "${utility_output}" == "1" ]; then
                echo "CRITICAL: Found ${utility_output} file \"${FILENAME}\" in \"${PATHTOFOLDER}\"."
                exit $STATE_CRITICAL
        else
                echo "CRITICAL: Found ${utility_output} files \"${FILENAME}\" in \"${PATHTOFOLDER}\"."
                exit $STATE_CRITICAL
        fi
[root@ds-pr-onlapp01 plugins]#

#
#	Some commands were saved for quick usage.
[root@ds-pr-onlapp01 plugins]# mv check_core_files.sh{,.20180828.backup} ; mv check_core_files{_mod,}.sh
[root@ds-pr-onlapp01 plugins]# scp check_core_files.sh m1-pr-onlapp01:/opt/TCS/scripts/nagios/plugins/check_core_files_mod.sh
[root@m1-pr-onlapp01 plugins]# mv check_core_files.sh{,.20180828.backup} ; mv check_core_files{_mod,}.sh
