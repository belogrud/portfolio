# This script produced by Sergey Belogrud at 25.02.2015.
# Purpose of this script is archive directories older then 30 days and after success remove the directories.
# Task and condition are to produce a script like this one. It could be found in Service Desk #432518.
# This script is using on m1-smev02 server.

#!/bin/bash

for pid in $(/sbin/pidof -x $(/bin/basename $0)) ; do
    if [ $pid != $$ ]; then
        echo "Process is already running with PID $pid"
        exit 1
    fi
done

base_dir_path="/mnt/FSSP_data/opt_id-sys_db/data/attachment/"

cd ${base_dir_path}
for var1 in $(find ${base_dir_path} -maxdepth 1 -type d -name $(date +%Y)\[0-9\]\[0-9\]\[0-9\]\[0-9\] -exec basename {} \;)
 do
  if [ ${var1} -le $(date +%Y%m%d -d "30 days ago") ]
   then
    echo "Start archivating directory: ${var1}"
    /usr/bin/time -f "Elapsed real time: %E\nPercentage of the CPU that this job got: %P\n" /bin/tar -czspf ${base_dir_path}${var1}.tgz ${var1}
    if [ $? -eq 0 ]
     then
      echo "Start deleting archived directory: ${var1}"
      /usr/bin/time -f "Elapsed real time: %E\nPercentage of the CPU that this job got: %P\n" rm -rf ${var1}
     fi
   fi 
 done

[root@m1-smev02 ~]# cat /var/spool/cron/root
# For details see man 4 crontabs

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  *  command to be executed

01   0  *  *  *  /opt/TCS/scripts/archive.one.month.old.directories.sh 2>&1 1>/dev/null

[root@m1-smev02 ~]#
