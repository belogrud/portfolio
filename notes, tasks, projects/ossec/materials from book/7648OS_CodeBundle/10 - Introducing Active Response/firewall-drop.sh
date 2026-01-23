#!/bin/sh
#
# Parameters:
#    $1 = action (delete or add)
#    $2 = user (or - if not set)
#    $3 = source IP (or - if not set)
#    $4 = Alert ID (unique for every alert)
#    $5 = Rule ID
#    $6 = Agent name OR host OR filename (based on context)

ACTION=$1
SRCIP=$3

if [ "$ACTION" == "add"]; then
    /usr/sbin/iptables -I FORWARD -s $SRCIP -j DROP
    /usr/sbin/iptables -I INPUT -s $SRCIP -j DROP
elif [ "$ACTION" == "delete"]; then
    /usr/sbin/iptables -D FORWARD -s $SRCIP -j DROP
    /usr/sbin/iptables -D INPUT -s $SRCIP -j DROP
else
    echo "invalid action, specific add or delete";
    exit 1;
fi;
