#
#	I have a chat with Sergey Trushnikov via Slack.
#	There we can find some details how this task was resolved.
#


................................................................................

#
#	As a base was taken follow script, that was made by Pavel Serlin.
#

[root@vm-dbamon01 online4]# cat /opt/TCS/scripts/nagios/plugins/online4/online4_stopped_workers.sh
#!/bin/bash

SQL_QUERY_HOST='db-online4-prod'
SQL_QUERY_PORT='1522'
SQL_QUERY_BASE='ONLINE4'
SQL_QUERY_USER='tcs_monitor'
SQL_QUERY_PASSWORD='monitor_1'

SQL_QUERY_DIR=/opt/TCS/scripts/nagios/plugins
SQL_QUERY_FILE=$SQL_QUERY_DIR/online4/online4_stopped_workers.sql
KEY_FILE=$SQL_QUERY_DIR/online4/online4_stopped_workers.key

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

export ORACLE_HOME=/opt/oracle/products/11g/client
export PATH=$PATH:/$ORACLE_HOME/bin

for i in {0..2};do
  SSHRESULT2=$(ssh -i $KEY_FILE dbamon@pr-onl-ha "bash -s" -- < $SQL_QUERY_DIR/online4/netstat_IRIS.sh  2> /dev/null)
  if [[ $? -eq $STATE_OK ]]; then
    SQLRESULT=$(echo "exit" | sqlplus -s $SQL_QUERY_USER/$SQL_QUERY_PASSWORD@\"$SQL_QUERY_HOST:$SQL_QUERY_PORT/$SQL_QUERY_BASE\" @$SQL_QUERY_FILE)
    SSHRESULT=$(ssh -i $KEY_FILE dbamon@pr-onl-ha 'ps -ef|grep "/home/online/bin/extfgiris.system 2 " | grep -v grep | wc -l' 2> /dev/null )
    TraceParam=$(ssh -i $KEY_FILE dbamon@pr-onl-ha 'find /home/online/traces/ -name 'extfg*.dmp' ! -name 'extfg.dmp' | wc -l' 2> /dev/null )



#echo $SQLRESULT2
#echo $SSHRESULT
#echo $TraceParam

   if [ $SQLRESULT -eq $SSHRESULT ];then
        if [ $TraceParam -eq $SQLRESULT ]; then
      echo "OK. Result=$STATE_OK"
      exit $STATE_OK
    else
        lost_traces=$(($SQLRESULT-$TraceParam))
        echo "Critical. Result = $lost_traces/$SQLRESULT workers are freezed!"
        exit $STATE_CRITICAL
     fi
        else
              STOPPED_WORKERS=$(($SQLRESULT - $SSHRESULT))
              echo "ERROR. Result=$STOPPED_WORKERS/$SSHRESULT workers DOWN!"
        exit $STATE_CRITICAL
    fi
  fi
done

echo $SSHRESULT2
exit $STATE_CRITICAL
[root@vm-dbamon01 online4]#


................................................................................


[root@vm-dbamon01 online4]# pwd
/opt/TCS/scripts/nagios/plugins/online4
[root@vm-dbamon01 online4]#

#
#	The script "/home/online/bin/onlsync" that placed on pr-onl-ha server does not work properly if it run under other accounts than "online".
#

[root@vm-dbamon01 online4]# cat ./online4_unsynchronized_nodes.sh
#!/bin/bash

SQL_QUERY_HOST='db-online4-prod'
SQL_QUERY_PORT='1522'
SQL_QUERY_BASE='ONLINE4'
SQL_QUERY_USER='tcs_monitor'
SQL_QUERY_PASSWORD='monitor_1'

SQL_QUERY_DIR=/opt/TCS/scripts/nagios/plugins
KEY_FILE=$SQL_QUERY_DIR/online4/online4_stopped_workers.key

ALERT_NAME="ONLINE ISS - Unsynchronized nodes"
ALERT_OUTPUT="Standby node is not in sync with active!"

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

export ORACLE_HOME=/opt/oracle/products/11g/client
export PATH=$PATH:/$ORACLE_HOME/bin

for (( count=1; count<=3; count++))
        do
                # echo "count= $count"
                SSHRESULT=$(ssh -i $KEY_FILE dbamon@pr-onl-ha "bash -s" -- < $SQL_QUERY_DIR/online4/netstat_IRIS.sh  2> /dev/null)
                # /bin/false
                if [[ $? -eq $STATE_OK ]]
                        then
                                RESULT=$(ssh -i $KEY_FILE online@pr-onl-ha '/home/online/bin/onlsync check >/dev/null ; echo $?' )
                                # echo "RESULT= $RESULT"

                                if [ $RESULT -eq 0 ]
                                        then
                                                echo "OK. Result=$RESULT"
                                                exit $STATE_OK
                                        else
                                                echo "CRITICAL $ALERT_NAME $ALERT_OUTPUT"
                                                exit $STATE_CRITICAL
                                fi
                fi
done

echo $SSHRESULT
exit $STATE_CRITICAL
[root@vm-dbamon01 online4]#



[root@vm-dbamon01 online4]# time ./online4_unsynchronized_nodes.sh
count= 1
RESULT= 1
CRITICAL ONLINE ISS - Unsynchronized nodes Standby node is not in sync with active!

real    0m8.348s
user    0m0.010s
sys     0m0.010s
[root@vm-dbamon01 online4]# vim ./online4_unsynchronized_nodes.sh

[root@vm-dbamon01 online4]# ./online4_unsynchronized_nodes.sh
CRITICAL ONLINE ISS - Unsynchronized nodes Standby node is not in sync with active!
[root@vm-dbamon01 online4]#


...........................................................................

#
#	To test how it works under "online" user.
#
[root@vm-dbamon01 ~]# ssh -i /opt/TCS/scripts/nagios/plugins/online4/online4_stopped_workers.key online@pr-onl-ha
Last login: Tue Jul 17 18:17:49 2018 from vm-dbamon01.tcsbank.ru
<PROD_ISS_DS_STNB_N2>|18:18:11 Tue Jul 17 [online@ds-pr-onl02]: ~
$
<PROD_ISS_DS_STNB_N2>|18:18:12 Tue Jul 17 [online@ds-pr-onl02]: ~
$ /home/online/bin/onlsync check >/dev/null
<PROD_ISS_DS_STNB_N2>|18:18:34 Tue Jul 17 [online@ds-pr-onl02]: ~
$ echo $?
1
<PROD_ISS_DS_STNB_N2>|18:18:43 Tue Jul 17 [online@ds-pr-onl02]: ~
$ logout
Connection to pr-onl-ha closed.
[root@vm-dbamon01 ~]#

...........................................................................


[root@vm-dbamon01 ~]# vim /etc/nrpe.d/check_db_online4.cfg
...
#SD#1532244
command[online4_unsynchronized_nodes]=/opt/TCS/scripts/nagios/plugins/online4/online4_unsynchronized_nodes.sh


# SD#1532244
define service{
        use                             generic-service
        host_name                       vm-dbamon01
        service_description             ONLINE ISS – Unsynchronized nodes
        check_command                   check_nrpe!online4_unsynchronized_nodes
        check_interval                  1
        first_notification_delay        0
        contact_groups                  empty-group
        contacts                      s.morozkin_email,s.morozkin_sms,pss_24x7_email,d.a.makeev_sms,processing_duty_sms,s.polyakov_sms,s.polyakov_email,d.a.makeev_sms,v.leshchuk_sms,m.lazykin_email,m.lazykin_sms,d.gavrilin_sms
        notification_options            w,u,c,r
        flap_detection_enabled          0
        max_check_attempts              48
        notification_interval           5
}

...........................................................................

#
#	20180718
#

#	I was made some changes in my script to change its output like a script below.
#
[root@vm-dbamon01 etc]# vim -o /opt/TCS/scripts/nagios/plugins/online4/online4-check_tcs_monitor_00_rc.sh
...
if [ "$RESULT" = 0 ]; then
  echo "Connection OK. Result=$RESULT"
  exit $STATE_OK
else
  echo "ERROR. Result=$RESULT"
  exit $STATE_CRITICAL
fi



