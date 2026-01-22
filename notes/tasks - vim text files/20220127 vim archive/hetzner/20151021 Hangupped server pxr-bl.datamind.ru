



From: Belogrud Sergey Vladimirovich
Sent: Wednesday, October 21, 2015 12:13 PM
To: Bezrukikh Georgiy Gennadyevich
Cc: unix-admins
Subject: RE: Недосутпность pxr-bl.datamind.ru

Аппаратная перезагрузка решила вопрос.
Сервер доступен по ssh и ping.

Welcome to Ubuntu 12.04.4 LTS (GNU/Linux 3.11.0-15-generic x86_64)

* Documentation:  https://help.ubuntu.com/
New release '14.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

bsv@pxr-bl:~$



>   From: Bezrukikh Georgiy Gennadyevich
Sent: Wednesday, October 21, 2015 12:06 PM
To: helpdesk_in; unix-admins
Subject: RE: Недосутпность pxr-bl.datamind.ru

>   Коллеги, до окончания разбирательств с сервером pxr-bl.datamind.ru, просьба настроить резолв адресов:
>   sync.pool.datamind.ru
>   syncsw.pool.datamind.ru
>   На второй балансировщик: 85.10.201.55

>
Георгий Безруких
Системный администратор
Перенастройка не требуется.
Тем более, что это займёт больше времени и руководства, как это сделать у Вас нет – я прав?

Проверяйте доступность сервисов pxr-bl.datamind.ru.

From: Belogrud Sergey Vladimirovich
Sent: Wednesday, October 21, 2015 12:05 PM
To: Bezrukikh Georgiy Gennadyevich
Cc: unix-admins
Subject: RE: Недосутпность pxr-bl.datamind.ru

Добрый день.

Похоже на сервере высокий LA.

Пинги периодически появляются, но по ssh подключиться не возможно.
bsv@bk1:~$ ping 148.251.1.147
PING 148.251.1.147 (148.251.1.147) 56(84) bytes of data.
64 bytes from 148.251.1.147: icmp_req=41 ttl=58 time=2.79 ms

--- 148.251.1.147 ping statistics ---
64 packets transmitted, 1 received, 98% packet loss, time 63314ms
rtt min/avg/max/mdev = 2.795/2.795/2.795/0.000 ms
bsv@bk1:~$

Программная перезагрузка пока результатов не принесла.


From: Bezrukikh Georgiy Gennadyevich
Sent: Wednesday, October 21, 2015 11:28 AM
To: helpdesk_in; unix-admins
Subject: Недосутпность pxr-bl.datamind.ru

Здравствуйте, коллеги!

С 02:12 недоступен сервер pxr-bl.datamind.ru. По ssh на него зайти не получается.
Предполагаю, что его нужно перезагрузить.

С уважением,

Георгий Безруких
Системный администратор


................................................................................
................................................................................


v@pxr-bl:~$ last reboot
reboot   system boot  3.11.0-15-generi Wed Oct 21 12:08 - 12:13  (00:04)
reboot   system boot  3.11.0-15-generi Mon Oct  5 00:41 - 12:13 (16+11:31)

wtmp begins Thu Oct  1 14:45:24 2015
bsv@pxr-bl:~$


bsv@pxr-bl:~$ pstree -achplu | vim -
-bash: pipe error: Too many open files in system
-bash: start_pipeline: pgrp pipe: Too many open files in system
bsv@pxr-bl:~$ ps aux | less
-bash: pipe error: Too many open files in system
-bash: start_pipeline: pgrp pipe: Too many open files in system
bsv@pxr-bl:~$ sudo -i
-bash: start_pipeline: pgrp pipe: Too many open files in system
-bash: /usr/bin/sudo: Too many open files in system
bsv@pxr-bl:~$

................................................................................

bsv@bk1:~$ sshpass -e ssh -t -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@pxr-bl.datamind.ru
Welcome to Ubuntu 12.04.4 LTS (GNU/Linux 3.11.0-15-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
New release '14.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Oct 21 13:14:01 2015 from puppet
bsv@pxr-bl:~$ crontab -e
-bash: start_pipeline: pgrp pipe: Too many open files in system
-bash: /usr/bin/crontab: Too many open files in system
bsv@pxr-bl:~$ mv /var/spoo-bash: /dev/null: Too many open files in system
bash: _upvars: `-a2': invalid number specifier
-bash: words: bad array subscript
-bash: cannot make pipe for command substitution: Too many open files in system
-bash: cannot make pipe for command substitution: Too many open files in system
logout
-bash: /home/bsv/.bash_logout: Too many open files in system
-bash: /etc/bash.bash_logout: Too many open files in system
Connection to pxr-bl.datamind.ru closed.
bsv@bk1:~$ sshpass -e ssh -t -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@pxr-bl.datamind.ru
Welcome to Ubuntu 12.04.4 LTS (GNU/Linux 3.11.0-15-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
New release '14.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Oct 21 13:17:45 2015 from puppet
/bin/bash: Too many open files in system
Connection to pxr-bl.datamind.ru closed.
bsv@bk1:~$

................................................................................

bsv@bk1:~$ sshpass -e ssh -t -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@pxr-bl.datamind.ru "( sudo -i sh -c $' mv /var/spool/cron/crontabs/root /root/crontab.root ' )"
[sudo] password for bsv:
Connection to pxr-bl.datamind.ru closed.
bsv@bk1:~$ sshpass -e ssh -t -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@pxr-bl.datamind.ru
Welcome to Ubuntu 12.04.4 LTS (GNU/Linux 3.11.0-15-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
New release '14.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Oct 21 13:25:18 2015 from puppet
/bin/bash: Too many open files in system
Connection to pxr-bl.datamind.ru closed.
bsv@bk1:~$

................................................................................


root@pxr-bl ~ # apt-get install atop
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
  atop
0 upgraded, 1 newly installed, 0 to remove and 145 not upgraded.
Need to get 169 kB of archives.
After this operation, 492 kB of additional disk space will be used.
Get:1 http://mirror.hetzner.de/ubuntu/packages/ precise/universe atop amd64 1.26-0ubuntu1 [169 kB]
Fetched 169 kB in 0s (3,266 kB/s)
Selecting previously unselected package atop.
(Reading database ... 59502 files and directories currently installed.)
Unpacking atop (from .../atop_1.26-0ubuntu1_amd64.deb) ...
Processing triggers for man-db ...
Processing triggers for ureadahead ...
Setting up atop (1.26-0ubuntu1) ...
Starting atop system monitor: atop.
root@pxr-bl ~ #


root@pxr-bl ~ # apt-get install dstat
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
  dstat
0 upgraded, 1 newly installed, 0 to remove and 145 not upgraded.
Need to get 68.1 kB of archives.
After this operation, 549 kB of additional disk space will be used.
Get:1 http://mirror.hetzner.de/ubuntu/packages/ precise/universe dstat all 0.7.2-2 [68.1 kB]
Fetched 68.1 kB in 0s (5,534 kB/s)
Selecting previously unselected package dstat.
(Reading database ... 59520 files and directories currently installed.)
Unpacking dstat (from .../archives/dstat_0.7.2-2_all.deb) ...
Processing triggers for man-db ...
Setting up dstat (0.7.2-2) ...
root@pxr-bl ~ #

................................................................................

root@pxr-bl ~ # netstat -antp | awk '{ print $6 }' | sort | uniq -c
      1 established)
      5 ESTABLISHED
      1 Foreign
      2 LAST_ACK
      6 LISTEN
     33 TIME_WAIT
root@pxr-bl ~ #

................................................................................

root@pxr-bl ~ # grep -ir -e smart /etc/cron*
root@pxr-bl ~ # grep -ir -e smart /etc/smart*
/etc/smartd.conf:# smartd.conf by FastVPS
/etc/smartd.conf:# backup version of distrib file saved to /etc/smartd.conf.dist
/etc/smartd.conf.dist:# Sample configuration file for smartd.  See man smartd.conf.
/etc/smartd.conf.dist:# Home page is: http://smartmontools.sourceforge.net
/etc/smartd.conf.dist:# smartd will re-read the configuration file if it receives a HUP
/etc/smartd.conf.dist:# The file gives a list of devices to monitor using smartd, with one
/etc/smartd.conf.dist:# configuration file to be ignored: it tells smartd to scan for all
/etc/smartd.conf.dist:DEVICESCAN -d removable -n standby -m root -M exec /usr/share/smartmontools/smartd-runner
/etc/smartd.conf.dist:# Monitor SMART status, ATA Error Log, Self-test log, and track
/etc/smartd.conf.dist:# Send mail on SMART failures or when Temperature is >= 55 Celsius.
/etc/smartd.conf.dist:# A very silent check.  Only report SMART health status if it fails
/etc/smartd.conf.dist:# First two SCSI disks.  This will monitor everything that smartd can
/etc/smartd.conf.dist:# Monitor 2 disks connected to the first HP SmartArray controller which
/etc/smartd.conf.dist:# PLEASE SEE THE smartd.conf MAN PAGE FOR DETAILS
/etc/smartd.conf.dist:#   -H      Monitor SMART Health Status, report if failed
/etc/smartd.conf.dist:#   -l TYPE Monitor SMART log.  Type is one of: error, selftest
/etc/smartd.conf.dist:# then smartd will scan for devices /dev/hd[a-l] and /dev/sd[a-z]
/etc/smartmontools/run.d/10powersave-notify:$SMARTD_MESSAGE"
root@pxr-bl ~ #

root@pxr-bl ~ # ps aux | grep -i smart
root      1322  0.0  0.0  19648  1348 ?        S    14:00   0:00 /usr/sbin/smartd --pidfile /var/run/smartd.pid
root      8544  0.0  0.0   9396   956 pts/0    S+   17:19   0:00 grep --color=auto -i smart
root@pxr-bl ~ #

................................................................................

man smartd
...
EXAMPLES
       smartd
       Runs the daemon in forked mode. This is the normal way to run smartd.  Entries are logged to SYSLOG.

       smartd -d -i 30
       Run in foreground (debug) mode, checking the disk status every 30 seconds.

       smartd -q onecheck
       Registers  devices,  and  checks the status of the devices exactly once. The exit status (the bash $?  variable) will be zero if all went well, and nonzero if no devices were detected or some
       other problem was encountered.

       Note that smartmontools provides a start-up script in /etc/init.d/smartd which is responsible for starting and stopping the daemon via the normal init interface.  Using this script,  you  can
       start smartd by giving the command:
       /etc/init.d/smartd start
       and stop it by using the command:
       /etc/init.d/smartd stop

root@pxr-bl ~ # cat /etc/smartd.conf
# smartd.conf by FastVPS
# backup version of distrib file saved to /etc/smartd.conf.dist

# Discover disks and run short tests every day at 02:00 and long tests every sunday at 03:00
DEVICESCAN -d removable -n standby -s (S/../.././02|L/../../7/03)
root@pxr-bl ~ #


root@pxr-bl ~ # smartd -q onecheck
smartd 5.41 2011-06-09 r3365 [x86_64-linux-3.11.0-15-generic] (local build)
Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net

Opened configuration file /etc/smartd.conf
Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
glob(3) found no matches for pattern /dev/hd[a-t]
glob(3) found no matches for pattern /dev/sd[a-c][a-z]
Device: /dev/sda, type changed from 'scsi' to 'sat'
Device: /dev/sda [SAT], opened
Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Device: /dev/sda [SAT], not found in smartd database.
Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb, type changed from 'scsi' to 'sat'
Device: /dev/sdb [SAT], opened
Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Device: /dev/sdb [SAT], not found in smartd database.
Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Monitoring 2 ATA and 0 SCSI devices
Device: /dev/sda [SAT], opened ATA device
Device: /dev/sda [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Device: /dev/sda [SAT], previous self-test completed without error
Device: /dev/sdb [SAT], opened ATA device
Device: /dev/sdb [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Device: /dev/sdb [SAT], previous self-test completed without error
Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Started with '-q onecheck' option. All devices sucessfully checked once.
smartd is exiting (exit status 0)
root@pxr-bl ~ #

................................................................................

#   Unfortunately, I could not find information about HDD serial number before 21-st of october (when this server had trouble).
#
root@pxr-bl ~ # for var1 in $(find /var/log/ -name dmesg*) ; do echo ${var1} ; stat --printf=%y ${var1} ; echo ; less ${var1} | grep -w -e WDC -e "S/N:" ; done
/var/log/dmesg.4.gz
2015-10-21 12:08:31.052328991 +0300
[    0.923240] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.923390] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.924768] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
[    0.925184] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
/var/log/dmesg.0
2015-10-21 13:25:11.765515988 +0300
[    0.916268] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.916771] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.917498] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
[    0.918146] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
/var/log/dmesg.2.gz
2015-10-21 13:17:42.547210866 +0300
[    0.920322] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.923497] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.924673] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
[    0.925335] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
/var/log/dmesg.3.gz
2015-10-21 12:29:15.570631990 +0300
[    0.915201] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.915351] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.917061] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
[    0.917413] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
/var/log/dmesg
2015-10-21 14:00:58.310976985 +0300
[    0.916073] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.916221] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.917477] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
[    0.917757] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
/var/log/dmesg.1.gz
2015-10-21 13:22:08.526252984 +0300
[    0.919745] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.919893] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
[    0.921939] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
[    0.922310] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
root@pxr-bl ~ #

root@pxr-bl ~ # for var1 in $(find /var/log/ -name syslog*) ; do echo ${var1} ; stat --printf=%y ${var1} ; echo ; less ${var1} | grep -w -e WDC -e "S/N:" ; done
/var/log/syslog.6.gz
2015-10-16 07:10:01.000000000 +0300
/var/log/syslog.5.gz
2015-10-17 07:15:01.000000000 +0300
/var/log/syslog.4.gz
2015-10-18 08:20:01.000000000 +0300
/var/log/syslog.1
2015-10-22 07:15:01.110507137 +0300
Oct 21 12:08:28 pxr-bl kernel: [    0.923240] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 12:08:28 pxr-bl kernel: [    0.923390] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 12:08:28 pxr-bl kernel: [    0.924768] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 12:08:28 pxr-bl kernel: [    0.925184] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 12:29:13 pxr-bl kernel: [    0.915201] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 12:29:13 pxr-bl kernel: [    0.915351] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 12:29:13 pxr-bl kernel: [    0.917061] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 12:29:13 pxr-bl kernel: [    0.917413] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 13:17:39 pxr-bl kernel: [    0.920322] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 13:17:39 pxr-bl kernel: [    0.923497] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 13:17:39 pxr-bl kernel: [    0.924673] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 13:17:39 pxr-bl kernel: [    0.925335] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 13:17:44 pxr-bl smartd[1316]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 13:22:05 pxr-bl kernel: [    0.919745] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 13:22:05 pxr-bl kernel: [    0.919893] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 13:22:05 pxr-bl kernel: [    0.921939] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 13:22:05 pxr-bl kernel: [    0.922310] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 13:25:09 pxr-bl kernel: [    0.916268] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 13:25:09 pxr-bl kernel: [    0.916771] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 13:25:09 pxr-bl kernel: [    0.917498] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 13:25:09 pxr-bl kernel: [    0.918146] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 13:25:13 pxr-bl smartd[1335]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 14:00:55 pxr-bl kernel: [    0.916073] ata2.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 14:00:55 pxr-bl kernel: [    0.916221] ata1.00: ATA-8: WDC WD2000FYYZ-01UL1B1, 01.01K02, max UDMA/133
Oct 21 14:00:55 pxr-bl kernel: [    0.917477] scsi 0:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 14:00:55 pxr-bl kernel: [    0.917757] scsi 1:0:0:0: Direct-Access     ATA      WDC WD2000FYYZ-0 01.0 PQ: 0 ANSI: 5
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
/var/log/syslog
2015-10-22 12:05:01.641177999 +0300
/var/log/syslog.2.gz
2015-10-20 07:19:01.000000000 +0300
/var/log/syslog.3.gz
2015-10-19 07:23:08.000000000 +0300
/var/log/syslog.7.gz
2015-10-15 07:07:01.000000000 +0300
root@pxr-bl ~ #

................................................................................


root@pxr-bl ~ # smartd -d
smartd 5.41 2011-06-09 r3365 [x86_64-linux-3.11.0-15-generic] (local build)
Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net

Opened configuration file /etc/smartd.conf
Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
glob(3) found no matches for pattern /dev/hd[a-t]
glob(3) found no matches for pattern /dev/sd[a-c][a-z]
Device: /dev/sda, type changed from 'scsi' to 'sat'
Device: /dev/sda [SAT], opened
Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Device: /dev/sda [SAT], not found in smartd database.
Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb, type changed from 'scsi' to 'sat'
Device: /dev/sdb [SAT], opened
Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Device: /dev/sdb [SAT], not found in smartd database.
Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Monitoring 2 ATA and 0 SCSI devices
Device: /dev/sda [SAT], opened ATA device
Device: /dev/sda [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Device: /dev/sda [SAT], previous self-test completed without error
Device: /dev/sdb [SAT], opened ATA device
Device: /dev/sdb [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Device: /dev/sdb [SAT], previous self-test completed without error
Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
^CDevice: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state

Signal INT - rereading configuration file /etc/smartd.conf (CONTROL-\ quits)

Opened configuration file /etc/smartd.conf
Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
glob(3) found no matches for pattern /dev/hd[a-t]
glob(3) found no matches for pattern /dev/sd[a-c][a-z]
Device: /dev/sda, type changed from 'scsi' to 'sat'
Device: /dev/sda [SAT], opened
Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Device: /dev/sda [SAT], not found in smartd database.
Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb, type changed from 'scsi' to 'sat'
Device: /dev/sdb [SAT], opened
Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Device: /dev/sdb [SAT], not found in smartd database.
Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Monitoring 2 ATA and 0 SCSI devices
Device: /dev/sda [SAT], opened ATA device
Device: /dev/sdb [SAT], opened ATA device
Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
quit
^CDevice: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state

Signal INT - rereading configuration file /etc/smartd.conf (CONTROL-\ quits)

Opened configuration file /etc/smartd.conf
Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
glob(3) found no matches for pattern /dev/hd[a-t]
glob(3) found no matches for pattern /dev/sd[a-c][a-z]
Device: /dev/sda, type changed from 'scsi' to 'sat'
Device: /dev/sda [SAT], opened
Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Device: /dev/sda [SAT], not found in smartd database.
Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb, type changed from 'scsi' to 'sat'
Device: /dev/sdb [SAT], opened
Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Device: /dev/sdb [SAT], not found in smartd database.
Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Monitoring 2 ATA and 0 SCSI devices
Device: /dev/sda [SAT], opened ATA device
Device: /dev/sdb [SAT], opened ATA device
Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
^Z
[1]+  Stopped                 smartd -d
root@pxr-bl ~ #


root@pxr-bl ~ # jobs
[1]+  Stopped                 smartd -d
root@pxr-bl ~ # kill %1
smartd received signal 15: Terminated
root@pxr-bl ~ # Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
smartd is exiting (exit status 0)

[1]+  Done                    smartd -d
root@pxr-bl ~ #

................................................................................

root@pxr-bl ~ # grep smartd /var/log/syslog
Oct 21 02:11:31 pxr-bl smartd[1319]: Device: /dev/sda [SAT], starting scheduled Short Self-Test.
Oct 21 02:11:31 pxr-bl smartd[1319]: Device: /dev/sdb [SAT], starting scheduled Short Self-Test.
Oct 21 02:41:28 pxr-bl smartd[1319]: Device: /dev/sda [SAT], self-test in progress, 10% remaining
Oct 21 02:41:32 pxr-bl smartd[1319]: Device: /dev/sdb [SAT], SMART Usage Attribute: 194 Temperature_Celsius changed from 122 to 120
Oct 21 02:41:32 pxr-bl smartd[1319]: Device: /dev/sdb [SAT], self-test in progress, 10% remaining
Oct 21 04:11:35 pxr-bl smartd[1319]: Device: /dev/sda [SAT], SMART Usage Attribute: 194 Temperature_Celsius changed from 122 to 121
Oct 21 05:11:43 pxr-bl smartd[1319]: Device: /dev/sda [SAT], SMART Usage Attribute: 194 Temperature_Celsius changed from 121 to 122
Oct 21 12:08:32 pxr-bl smartd[1289]: smartd 5.41 2011-06-09 r3365 [x86_64-linux-3.11.0-15-generic] (local build)
Oct 21 12:08:32 pxr-bl smartd[1289]: Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net
Oct 21 12:08:32 pxr-bl smartd[1289]: Opened configuration file /etc/smartd.conf
Oct 21 12:08:32 pxr-bl smartd[1289]: Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Oct 21 12:08:32 pxr-bl smartd[1289]: Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda, type changed from 'scsi' to 'sat'
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda [SAT], opened
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda [SAT], not found in smartd database.
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb, type changed from 'scsi' to 'sat'
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], opened
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], not found in smartd database.
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 12:08:32 pxr-bl smartd[1289]: Monitoring 2 ATA and 0 SCSI devices
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], SMART Usage Attribute: 194 Temperature_Celsius changed from 120 to 122
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 12:08:32 pxr-bl smartd[1289]: Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 12:08:32 pxr-bl smartd[1291]: smartd has fork()ed into background mode. New PID=1291.
Oct 21 12:08:32 pxr-bl smartd[1291]: file /var/run/smartd.pid written containing PID 1291
Oct 21 12:29:16 pxr-bl smartd[1328]: smartd 5.41 2011-06-09 r3365 [x86_64-linux-3.11.0-15-generic] (local build)
Oct 21 12:29:16 pxr-bl smartd[1328]: Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net
Oct 21 12:29:16 pxr-bl smartd[1328]: Opened configuration file /etc/smartd.conf
Oct 21 12:29:16 pxr-bl smartd[1328]: Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Oct 21 12:29:16 pxr-bl smartd[1328]: Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda, type changed from 'scsi' to 'sat'
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda [SAT], opened
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda [SAT], not found in smartd database.
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb, type changed from 'scsi' to 'sat'
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], opened
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], not found in smartd database.
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 12:29:16 pxr-bl smartd[1328]: Monitoring 2 ATA and 0 SCSI devices
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], SMART Usage Attribute: 194 Temperature_Celsius changed from 122 to 120
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 12:29:16 pxr-bl smartd[1328]: Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 12:29:16 pxr-bl smartd[1330]: smartd has fork()ed into background mode. New PID=1330.
Oct 21 12:29:16 pxr-bl smartd[1330]: file /var/run/smartd.pid written containing PID 1330
Oct 21 12:59:19 pxr-bl smartd[1330]: Device: /dev/sda [SAT], SMART Usage Attribute: 194 Temperature_Celsius changed from 122 to 121
Oct 21 13:17:44 pxr-bl smartd[1316]: smartd 5.41 2011-06-09 r3365 [x86_64-linux-3.11.0-15-generic] (local build)
Oct 21 13:17:44 pxr-bl smartd[1316]: Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net
Oct 21 13:17:44 pxr-bl smartd[1316]: Opened configuration file /etc/smartd.conf
Oct 21 13:17:44 pxr-bl smartd[1316]: Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Oct 21 13:17:44 pxr-bl smartd[1316]: Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
Oct 21 13:17:44 pxr-bl smartd[1316]: Device: /dev/sda, type changed from 'scsi' to 'sat'
Oct 21 13:17:44 pxr-bl smartd[1316]: Device: /dev/sda [SAT], opened
Oct 21 13:17:44 pxr-bl smartd[1316]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 13:17:44 pxr-bl smartd[1316]: Device: /dev/sda [SAT], not found in smartd database.
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb, type changed from 'scsi' to 'sat'
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], opened
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], not found in smartd database.
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 13:17:45 pxr-bl smartd[1316]: Monitoring 2 ATA and 0 SCSI devices
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sda [SAT], SMART Usage Attribute: 194 Temperature_Celsius changed from 121 to 122
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sda [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], SMART Usage Attribute: 194 Temperature_Celsius changed from 120 to 121
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 13:17:45 pxr-bl smartd[1316]: Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 13:17:45 pxr-bl smartd[1325]: smartd has fork()ed into background mode. New PID=1325.
Oct 21 13:17:45 pxr-bl smartd[1325]: file /var/run/smartd.pid written containing PID 1325
Oct 21 13:22:10 pxr-bl smartd[1326]: smartd 5.41 2011-06-09 r3365 [x86_64-linux-3.11.0-15-generic] (local build)
Oct 21 13:22:10 pxr-bl smartd[1326]: Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net
Oct 21 13:22:10 pxr-bl smartd[1326]: Opened configuration file /etc/smartd.conf
Oct 21 13:22:10 pxr-bl smartd[1326]: Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Oct 21 13:22:10 pxr-bl smartd[1326]: Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda, type changed from 'scsi' to 'sat'
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda [SAT], opened
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda [SAT], not found in smartd database.
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb, type changed from 'scsi' to 'sat'
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb [SAT], opened
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb [SAT], not found in smartd database.
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 13:22:10 pxr-bl smartd[1326]: Monitoring 2 ATA and 0 SCSI devices
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 13:22:10 pxr-bl smartd[1326]: Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 13:22:10 pxr-bl smartd[1328]: smartd has fork()ed into background mode. New PID=1328.
Oct 21 13:22:10 pxr-bl smartd[1328]: file /var/run/smartd.pid written containing PID 1328
Oct 21 13:25:13 pxr-bl smartd[1335]: smartd 5.41 2011-06-09 r3365 [x86_64-linux-3.11.0-15-generic] (local build)
Oct 21 13:25:13 pxr-bl smartd[1335]: Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net
Oct 21 13:25:13 pxr-bl smartd[1335]: Opened configuration file /etc/smartd.conf
Oct 21 13:25:13 pxr-bl smartd[1335]: Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Oct 21 13:25:13 pxr-bl smartd[1335]: Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
Oct 21 13:25:13 pxr-bl smartd[1335]: Device: /dev/sda, type changed from 'scsi' to 'sat'
Oct 21 13:25:13 pxr-bl smartd[1335]: Device: /dev/sda [SAT], opened
Oct 21 13:25:13 pxr-bl smartd[1335]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 13:25:13 pxr-bl smartd[1335]: Device: /dev/sda [SAT], not found in smartd database.
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb, type changed from 'scsi' to 'sat'
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb [SAT], opened
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb [SAT], not found in smartd database.
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 13:25:14 pxr-bl smartd[1335]: Monitoring 2 ATA and 0 SCSI devices
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sda [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 13:25:14 pxr-bl smartd[1335]: Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 13:25:14 pxr-bl smartd[1339]: smartd has fork()ed into background mode. New PID=1339.
Oct 21 13:25:14 pxr-bl smartd[1339]: file /var/run/smartd.pid written containing PID 1339
Oct 21 14:01:00 pxr-bl smartd[1317]: smartd 5.41 2011-06-09 r3365 [x86_64-linux-3.11.0-15-generic] (local build)
Oct 21 14:01:00 pxr-bl smartd[1317]: Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net
Oct 21 14:01:00 pxr-bl smartd[1317]: Opened configuration file /etc/smartd.conf
Oct 21 14:01:00 pxr-bl smartd[1317]: Drive: DEVICESCAN, implied '-a' Directive on line 5 of file /etc/smartd.conf
Oct 21 14:01:00 pxr-bl smartd[1317]: Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda, type changed from 'scsi' to 'sat'
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], opened
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094108, WWN:5-0014ee-25ee7ca3f, FW:01.01K02, 2.00 TB
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], not found in smartd database.
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb, type changed from 'scsi' to 'sat'
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb [SAT], opened
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb [SAT], WDC WD2000FYYZ-01UL1B1, S/N:WD-WCC1P1094508, WWN:5-0014ee-2b43de487, FW:01.01K02, 2.00 TB
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb [SAT], not found in smartd database.
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb [SAT], is SMART capable. Adding to "monitor" list.
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb [SAT], state read from /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 14:01:00 pxr-bl smartd[1317]: Monitoring 2 ATA and 0 SCSI devices
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], SMART Usage Attribute: 7 Seek_Error_Rate changed from 200 to 100
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb [SAT], offline data collection was suspended by an interrupting command from host (auto:on)
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sda [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094108.ata.state
Oct 21 14:01:00 pxr-bl smartd[1317]: Device: /dev/sdb [SAT], state written to /var/lib/smartmontools/smartd.WDC_WD2000FYYZ_01UL1B1-WD_WCC1P1094508.ata.state
Oct 21 14:01:00 pxr-bl smartd[1322]: smartd has fork()ed into background mode. New PID=1322.
Oct 21 14:01:00 pxr-bl smartd[1322]: file /var/run/smartd.pid written containing PID 1322
root@pxr-bl ~ #


root@pxr-bl ~ # cat /etc/cron.d/storage-system-monitoring-fastvps
# FastVPS disk monitoring tool
# https://github.com/FastVPSEestiOu/storage-system-monitoring
0 * * * * root perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron
root@pxr-bl ~ #


root@pxr-bl ~ # grep cron /var/log/syslog
...
Oct 21 01:00:01 pxr-bl CRON[28855]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 01:17:01 pxr-bl CRON[6002]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 02:00:01 pxr-bl CRON[30113]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 02:17:17 pxr-bl CRON[5038]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 03:00:14 pxr-bl CRON[20077]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 03:17:15 pxr-bl CRON[25752]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 04:00:16 pxr-bl CRON[8100]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 04:17:01 pxr-bl CRON[14271]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 05:00:06 pxr-bl CRON[30013]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 05:17:03 pxr-bl CRON[3852]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 12:08:30 pxr-bl cron[1002]: (CRON) INFO (pidfile fd = 3)
Oct 21 12:08:30 pxr-bl cron[1048]: (CRON) STARTUP (fork ok)
Oct 21 12:08:30 pxr-bl cron[1048]: (CRON) INFO (Running @reboot jobs)
Oct 21 12:17:01 pxr-bl CRON[5417]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 12:29:15 pxr-bl cron[1037]: (CRON) INFO (pidfile fd = 3)
Oct 21 12:29:15 pxr-bl cron[1046]: (CRON) STARTUP (fork ok)
Oct 21 12:29:15 pxr-bl cron[1046]: (CRON) INFO (Running @reboot jobs)
Oct 21 13:00:03 pxr-bl CRON[12164]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 13:17:41 pxr-bl cron[1013]: (CRON) INFO (pidfile fd = 3)
Oct 21 13:17:41 pxr-bl cron[1026]: (CRON) STARTUP (fork ok)
Oct 21 13:17:42 pxr-bl cron[1026]: (CRON) INFO (Running @reboot jobs)
Oct 21 13:22:08 pxr-bl cron[1033]: (CRON) INFO (pidfile fd = 3)
Oct 21 13:22:08 pxr-bl cron[1043]: (CRON) STARTUP (fork ok)
Oct 21 13:22:08 pxr-bl cron[1043]: (CRON) INFO (Running @reboot jobs)
Oct 21 13:25:11 pxr-bl cron[1073]: (CRON) INFO (pidfile fd = 3)
Oct 21 13:25:11 pxr-bl cron[1082]: (CRON) STARTUP (fork ok)
Oct 21 13:25:11 pxr-bl cron[1082]: (CRON) INFO (Running @reboot jobs)
Oct 21 14:00:57 pxr-bl cron[1057]: (CRON) INFO (pidfile fd = 3)
Oct 21 14:00:58 pxr-bl cron[1181]: (CRON) STARTUP (fork ok)
Oct 21 14:00:58 pxr-bl cron[1181]: (CRON) INFO (Running @reboot jobs)
Oct 21 14:17:01 pxr-bl CRON[2216]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 15:00:01 pxr-bl CRON[2808]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 15:17:01 pxr-bl CRON[3680]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 16:00:01 pxr-bl CRON[6228]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 16:02:19 pxr-bl crontab[6304]: (root) LIST (root)
Oct 21 16:09:38 pxr-bl cron[6574]: (CRON) DEATH (can't lock /var/run/crond.pid, otherpid may be 1181: Resource temporarily unavailable)
Oct 21 16:17:01 pxr-bl CRON[6784]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 17:00:01 pxr-bl CRON[8071]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
Oct 21 17:17:01 pxr-bl CRON[8385]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Oct 21 18:00:01 pxr-bl CRON[9789]: (root) CMD (perl /usr/local/bin/storage_system_fastvps_monitoring.pl --cron)
root@pxr-bl ~ #

................................................................................

#   The reason of this unconsistence of software raid possible hardware reset of this server, that I did to reboot it.
#
root@pxr-bl ~ # cat /proc/mdstat
Personalities : [raid1] [linear] [multipath] [raid0] [raid6] [raid5] [raid4] [raid10]
md2 : active raid1 sda3[0] sdb3[1]
      1936077760 blocks super 1.2 [2/2] [UU]
      [===============>.....]  resync = 79.3% (1536774592/1936077760) finish=82.6min speed=80478K/sec

md1 : active raid1 sdb2[1] sda2[0]
      523968 blocks super 1.2 [2/2] [UU]

md0 : active raid1 sdb1[1] sda1[0]
      16768896 blocks super 1.2 [2/2] [UU]

unused devices: <none>
root@pxr-bl ~ # cat /proc/mdstat
Personalities : [raid1] [linear] [multipath] [raid0] [raid6] [raid5] [raid4] [raid10]
md2 : active raid1 sda3[0] sdb3[1]
      1936077760 blocks super 1.2 [2/2] [UU]
      [================>....]  resync = 80.7% (1562717056/1936077760) finish=89.9min speed=69170K/sec

md1 : active raid1 sdb2[1] sda2[0]
      523968 blocks super 1.2 [2/2] [UU]

md0 : active raid1 sdb1[1] sda1[0]
      16768896 blocks super 1.2 [2/2] [UU]

unused devices: <none>
root@pxr-bl ~ #

root@pxr-bl ~ # last
g.bezruk pts/5        91.194.227.251   Wed Oct 21 19:03   still logged in
tan      pts/3        91.194.227.252   Wed Oct 21 18:59   still logged in
tan      pts/1        91.194.227.252   Wed Oct 21 18:34   still logged in
ash      pts/1        91.194.227.252   Wed Oct 21 17:59 - 18:08  (00:09)
g.bezruk pts/2        static.85-10-201 Wed Oct 21 15:14 - 18:19  (03:04)
bsv      pts/1        puppet           Wed Oct 21 15:14 - 15:14  (00:00)
g.bezruk pts/1        91.194.227.251   Wed Oct 21 15:13 - 15:13  (00:00)
bsv      pts/1        puppet           Wed Oct 21 15:04 - 15:04  (00:00)
g.bezruk pts/1        91.194.227.251   Wed Oct 21 14:48 - 14:48  (00:00)
g.bezruk pts/1        91.194.227.251   Wed Oct 21 14:48 - 14:48  (00:00)
bsv      pts/0        puppet           Wed Oct 21 14:01   still logged in
bsv      tty1                          Wed Oct 21 14:01   still logged in
bsv      tty1                          Wed Oct 21 14:01 - 14:01  (00:00)
reboot   system boot  3.11.0-15-generi Wed Oct 21 14:00 - 19:21  (05:20)
g.bezruk pts/0        91.194.227.251   Wed Oct 21 13:52 - 13:52  (00:00)
bsv      pts/0        puppet           Wed Oct 21 13:52 - 13:52  (00:00)
g.bezruk pts/0        91.194.227.251   Wed Oct 21 13:52 - 13:52  (00:00)
g.bezruk pts/0        91.194.227.251   Wed Oct 21 13:52 - 13:52  (00:00)
g.bezruk pts/0        91.194.227.251   Wed Oct 21 13:52 - 13:52  (00:00)
g.bezruk pts/0        91.194.227.251   Wed Oct 21 13:51 - 13:51  (00:00)
bsv      pts/0        puppet           Wed Oct 21 13:25 - 13:25  (00:00)
bsv      pts/0        puppet           Wed Oct 21 13:25 - 13:25  (00:00)
reboot   system boot  3.11.0-15-generi Wed Oct 21 13:25 - 19:21  (05:56)
bsv      pts/0        puppet           Wed Oct 21 13:22 - 13:22  (00:00)
bsv      pts/0        puppet           Wed Oct 21 13:22 - 13:22  (00:00)
reboot   system boot  3.11.0-15-generi Wed Oct 21 13:22 - 19:21  (05:59)
bsv      pts/0        puppet           Wed Oct 21 13:20 - 13:20  (00:00)
bsv      pts/0        puppet           Wed Oct 21 13:18 - 13:18  (00:00)
bsv      pts/0        puppet           Wed Oct 21 13:17 - 13:18  (00:00)
reboot   system boot  3.11.0-15-generi Wed Oct 21 13:17 - 19:21  (06:03)
bsv      pts/0        puppet           Wed Oct 21 13:14 - 13:14  (00:00)
bsv      pts/0        puppet           Wed Oct 21 13:04 - 13:04  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:56 - 12:56  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:53 - 12:53  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:53 - 12:53  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:45 - 12:45  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:44 - 12:44  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:34 - 12:34  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:30 - 12:30  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:30 - 12:30  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:29 - 12:29  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:29 - 12:29  (00:00)
bsv      pts/0        puppet           Wed Oct 21 12:29 - 12:29  (00:00)
reboot   system boot  3.11.0-15-generi Wed Oct 21 12:29 - 19:21  (06:51)
g.bezruk pts/1        91.194.227.251   Wed Oct 21 12:11 - 12:15  (00:03)
bsv      pts/0        puppet           Wed Oct 21 12:09 - crash  (00:19)
reboot   system boot  3.11.0-15-generi Wed Oct 21 12:08 - 19:21  (07:12)
g.bezruk pts/0        91.194.227.251   Tue Oct 20 18:12 - 19:42  (01:29)
g.bezruk pts/0        91.194.227.251   Tue Oct 20 15:00 - 17:30  (02:30)
g.bezruk pts/0        91.194.227.251   Mon Oct 19 15:09 - 19:39  (04:30)
g.bezruk pts/0        91.194.227.251   Mon Oct 19 13:21 - 14:53  (01:31)
g.bezruk pts/0        91.194.227.251   Mon Oct 19 11:18 - 13:13  (01:54)
g.bezruk pts/0        91.194.227.251   Fri Oct 16 19:28 - 20:02  (00:34)
g.bezruk pts/2        91.194.227.251   Fri Oct 16 15:54 - 20:24  (04:30)
g.bezruk pts/2        91.194.227.251   Fri Oct 16 15:04 - 15:35  (00:30)
g.bezruk pts/0        91.194.227.251   Fri Oct 16 14:59 - 16:48  (01:48)
g.bezruk pts/2        91.194.227.251   Fri Oct 16 11:55 - 12:27  (00:31)
g.bezruk pts/0        91.194.227.251   Fri Oct 16 11:27 - 13:57  (02:30)
g.bezruk pts/2        91.194.227.251   Thu Oct 15 18:56 - 19:28  (00:32)
g.bezruk pts/0        91.194.227.251   Thu Oct 15 18:40 - 20:10  (01:30)
g.bezruk pts/0        91.194.227.251   Thu Oct 15 17:49 - 18:39  (00:50)
g.bezruk pts/0        91.194.227.251   Thu Oct 15 15:18 - 17:48  (02:30)
g.bezruk pts/0        91.194.227.251   Thu Oct 15 14:19 - 14:51  (00:32)
g.bezruk pts/0        91.194.227.251   Thu Oct 15 11:39 - 13:21  (01:42)
g.bezruk pts/2        91.194.227.251   Wed Oct 14 14:57 - 15:31  (00:33)
g.bezruk pts/0        91.194.227.251   Wed Oct 14 14:40 - 19:32  (04:51)
g.bezruk pts/0        91.194.227.251   Wed Oct 14 12:44 - 13:28  (00:44)
g.bezruk pts/0        91.194.227.251   Tue Oct 13 14:09 - 15:39  (01:30)
g.bezruk pts/0        91.194.227.251   Tue Oct 13 12:51 - 13:41  (00:50)
g.bezruk pts/0        91.194.227.251   Tue Oct 13 12:02 - 12:48  (00:45)
g.bezruk pts/4        91.194.227.251   Tue Oct 13 10:54 - 11:25  (00:30)
g.bezruk pts/3        91.194.227.251   Tue Oct 13 10:54 - 11:25  (00:30)
g.bezruk pts/2        91.194.227.251   Tue Oct 13 10:54 - 11:25  (00:30)
g.bezruk pts/0        91.194.227.251   Tue Oct 13 10:54 - 11:25  (00:30)
g.bezruk pts/0        91.194.227.251   Mon Oct 12 12:39 - 13:22  (00:42)
g.bezruk pts/8        91.194.227.251   Mon Oct 12 10:57 - 10:58  (00:00)
g.bezruk pts/7        91.194.227.251   Mon Oct 12 10:57 - 10:58  (00:00)
g.bezruk pts/6        91.194.227.251   Mon Oct 12 10:57 - 11:27  (00:30)
g.bezruk pts/5        91.194.227.251   Mon Oct 12 10:57 - 11:32  (00:34)
g.bezruk pts/4        91.194.227.251   Mon Oct 12 10:57 - 11:35  (00:38)
g.bezruk pts/3        91.194.227.251   Mon Oct 12 10:57 - 11:28  (00:30)
g.bezruk pts/0        91.194.227.251   Mon Oct 12 10:57 - 10:58  (00:00)
g.bezruk pts/2        91.194.227.251   Mon Oct 12 10:57 - 10:58  (00:00)
g.bezruk pts/2        91.194.227.251   Fri Oct  9 16:18 - 17:56  (01:38)
g.bezruk pts/3        91.194.227.251   Fri Oct  9 14:53 - 15:29  (00:35)
g.bezruk pts/2        91.194.227.251   Fri Oct  9 14:08 - 15:38  (01:29)
g.bezruk pts/2        91.194.227.251   Fri Oct  9 10:49 - 13:45  (02:55)
g.bezruk pts/2        91.194.227.251   Thu Oct  8 20:21 - 00:13  (03:52)
g.bezruk pts/2        91.194.227.251   Thu Oct  8 17:10 - 19:50  (02:40)
root     pts/2        91.194.227.99    Thu Oct  8 15:31 - 15:31  (00:00)
g.bezruk pts/1        91.194.227.251   Thu Oct  8 14:48 - 17:29  (02:40)
g.bezruk pts/1        91.194.227.251   Thu Oct  8 11:25 - 12:01  (00:36)
g.bezruk pts/0        91.194.227.251   Wed Oct  7 19:12 - 16:36 (3+21:24)
g.bezruk pts/4        91.194.227.251   Wed Oct  7 15:53 - 20:23  (04:30)
g.bezruk pts/2        91.194.227.251   Wed Oct  7 15:52 - 17:27  (01:35)
g.bezruk pts/1        91.194.227.251   Wed Oct  7 15:51 - 07:21  (15:30)
g.bezruk pts/0        91.194.227.251   Wed Oct  7 14:02 - 18:32  (04:30)
g.bezruk pts/0        91.194.227.251   Wed Oct  7 12:07 - 12:37  (00:30)
g.bezruk pts/0        91.194.227.251   Wed Oct  7 10:59 - 11:40  (00:41)
g.bezruk pts/0        91.194.227.251   Tue Oct  6 19:00 - 19:32  (00:31)
g.bezruk pts/1        91.194.227.251   Tue Oct  6 17:29 - 18:59  (01:30)
g.bezruk pts/0        91.194.227.251   Tue Oct  6 17:05 - 18:37  (01:32)
ash      pts/0        91.194.227.252   Tue Oct  6 10:38 - 10:38  (00:00)
ash      pts/0        91.194.227.252   Mon Oct  5 17:31 - 20:01  (02:30)
ash      pts/0        91.194.227.252   Mon Oct  5 16:30 - 17:03  (00:32)
g.bezruk pts/2        91.194.227.251   Mon Oct  5 12:11 - 13:41  (01:30)
g.bezruk pts/3        91.194.227.251   Mon Oct  5 11:27 - 19:58 (3+08:30)
g.bezruk pts/2        91.194.227.251   Mon Oct  5 11:21 - 11:58  (00:37)
g.bezruk pts/1        91.194.227.251   Mon Oct  5 11:18 - 15:48  (04:30)
g.bezruk pts/0        91.194.227.251   Mon Oct  5 10:33 - 12:27  (01:53)
reboot   system boot  3.11.0-15-generi Mon Oct  5 00:41 - 19:21 (16+18:39)
g.bezruk pts/0        91.194.227.251   Thu Oct  1 14:45 - 14:57  (00:11)

wtmp begins Thu Oct  1 14:45:24 2015
root@pxr-bl ~ #

root@pxr-bl ~ # last -a -d -F -x -n 100
g.bezruk pts/5        Wed Oct 21 19:03:47 2015   still logged in                       91.194.227.251
tan      pts/3        Wed Oct 21 18:59:57 2015   still logged in                       91.194.227.252
tan      pts/1        Wed Oct 21 18:34:57 2015 - Wed Oct 21 19:31:09 2015  (00:56)     91.194.227.252
ash      pts/1        Wed Oct 21 17:59:10 2015 - Wed Oct 21 18:08:58 2015  (00:09)     91.194.227.252
g.bezruk pts/2        Wed Oct 21 15:14:36 2015 - Wed Oct 21 18:19:28 2015  (03:04)     static.85-10-201-55.clients.your-server.de
bsv      pts/1        Wed Oct 21 15:14:35 2015 - Wed Oct 21 15:14:38 2015  (00:00)     puppet
g.bezruk pts/1        Wed Oct 21 15:13:40 2015 - Wed Oct 21 15:13:40 2015  (00:00)     91.194.227.251
bsv      pts/1        Wed Oct 21 15:04:27 2015 - Wed Oct 21 15:04:27 2015  (00:00)     puppet
g.bezruk pts/1        Wed Oct 21 14:48:23 2015 - Wed Oct 21 14:48:23 2015  (00:00)     91.194.227.251
g.bezruk pts/1        Wed Oct 21 14:48:17 2015 - Wed Oct 21 14:48:17 2015  (00:00)     91.194.227.251
bsv      pts/0        Wed Oct 21 14:01:28 2015   still logged in                       puppet
bsv      tty1         Wed Oct 21 14:01:22 2015   still logged in                       0.0.0.0
bsv      tty1         Wed Oct 21 14:01:22 2015 - Wed Oct 21 14:01:22 2015  (00:00)     0.0.0.0
runlevel (to lvl 2)   Wed Oct 21 14:00:57 2015 - Wed Oct 21 19:31:24 2015  (05:30)     0.0.0.0
reboot   system boot  Wed Oct 21 14:00:57 2015 - Wed Oct 21 19:31:24 2015  (05:30)     0.0.0.0
g.bezruk pts/0        Wed Oct 21 13:52:52 2015 - Wed Oct 21 13:52:52 2015  (00:00)     91.194.227.251
bsv      pts/0        Wed Oct 21 13:52:42 2015 - Wed Oct 21 13:52:42 2015  (00:00)     puppet
g.bezruk pts/0        Wed Oct 21 13:52:41 2015 - Wed Oct 21 13:52:41 2015  (00:00)     91.194.227.251
g.bezruk pts/0        Wed Oct 21 13:52:15 2015 - Wed Oct 21 13:52:15 2015  (00:00)     91.194.227.251
g.bezruk pts/0        Wed Oct 21 13:52:06 2015 - Wed Oct 21 13:52:06 2015  (00:00)     91.194.227.251
g.bezruk pts/0        Wed Oct 21 13:51:57 2015 - Wed Oct 21 13:51:58 2015  (00:00)     91.194.227.251
bsv      pts/0        Wed Oct 21 13:25:27 2015 - Wed Oct 21 13:25:27 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 13:25:18 2015 - Wed Oct 21 13:25:20 2015  (00:00)     puppet
runlevel (to lvl 2)   Wed Oct 21 13:25:11 2015 - Wed Oct 21 14:00:57 2015  (00:35)     0.0.0.0
reboot   system boot  Wed Oct 21 13:25:11 2015 - Wed Oct 21 19:31:24 2015  (06:06)     0.0.0.0
bsv      pts/0        Wed Oct 21 13:22:23 2015 - Wed Oct 21 13:22:23 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 13:22:11 2015 - Wed Oct 21 13:22:13 2015  (00:00)     puppet
runlevel (to lvl 2)   Wed Oct 21 13:22:07 2015 - Wed Oct 21 13:25:11 2015  (00:03)     0.0.0.0
reboot   system boot  Wed Oct 21 13:22:07 2015 - Wed Oct 21 19:31:24 2015  (06:09)     0.0.0.0
bsv      pts/0        Wed Oct 21 13:20:20 2015 - Wed Oct 21 13:20:20 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 13:18:18 2015 - Wed Oct 21 13:18:18 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 13:17:45 2015 - Wed Oct 21 13:18:07 2015  (00:00)     puppet
runlevel (to lvl 2)   Wed Oct 21 13:17:41 2015 - Wed Oct 21 13:22:07 2015  (00:04)     0.0.0.0
reboot   system boot  Wed Oct 21 13:17:41 2015 - Wed Oct 21 19:31:24 2015  (06:13)     0.0.0.0
bsv      pts/0        Wed Oct 21 13:14:01 2015 - Wed Oct 21 13:14:01 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 13:04:46 2015 - Wed Oct 21 13:04:46 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:56:18 2015 - Wed Oct 21 12:56:18 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:53:39 2015 - Wed Oct 21 12:53:39 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:53:15 2015 - Wed Oct 21 12:53:15 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:45:05 2015 - Wed Oct 21 12:45:05 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:44:00 2015 - Wed Oct 21 12:44:00 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:34:17 2015 - Wed Oct 21 12:34:17 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:30:40 2015 - Wed Oct 21 12:30:40 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:30:17 2015 - Wed Oct 21 12:30:17 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:29:54 2015 - Wed Oct 21 12:29:54 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:29:46 2015 - Wed Oct 21 12:29:46 2015  (00:00)     puppet
bsv      pts/0        Wed Oct 21 12:29:37 2015 - Wed Oct 21 12:29:37 2015  (00:00)     puppet
runlevel (to lvl 2)   Wed Oct 21 12:29:15 2015 - Wed Oct 21 13:17:41 2015  (00:48)     0.0.0.0
reboot   system boot  Wed Oct 21 12:29:15 2015 - Wed Oct 21 19:31:24 2015  (07:02)     0.0.0.0
g.bezruk pts/1        Wed Oct 21 12:11:33 2015 - Wed Oct 21 12:15:05 2015  (00:03)     91.194.227.251
bsv      pts/0        Wed Oct 21 12:09:35 2015 - crash                     (00:19)     puppet
runlevel (to lvl 2)   Wed Oct 21 12:08:30 2015 - Wed Oct 21 12:29:15 2015  (00:20)     0.0.0.0
reboot   system boot  Wed Oct 21 12:08:30 2015 - Wed Oct 21 19:31:24 2015  (07:22)     0.0.0.0
g.bezruk pts/0        Tue Oct 20 18:12:58 2015 - Tue Oct 20 19:42:56 2015  (01:29)     91.194.227.251
g.bezruk pts/0        Tue Oct 20 15:00:26 2015 - Tue Oct 20 17:30:26 2015  (02:30)     91.194.227.251
g.bezruk pts/0        Mon Oct 19 15:09:27 2015 - Mon Oct 19 19:39:30 2015  (04:30)     91.194.227.251
g.bezruk pts/0        Mon Oct 19 13:21:46 2015 - Mon Oct 19 14:53:32 2015  (01:31)     91.194.227.251
g.bezruk pts/0        Mon Oct 19 11:18:53 2015 - Mon Oct 19 13:13:36 2015  (01:54)     91.194.227.251
g.bezruk pts/0        Fri Oct 16 19:28:41 2015 - Fri Oct 16 20:02:52 2015  (00:34)     91.194.227.251
g.bezruk pts/2        Fri Oct 16 15:54:48 2015 - Fri Oct 16 20:24:49 2015  (04:30)     91.194.227.251
g.bezruk pts/2        Fri Oct 16 15:04:47 2015 - Fri Oct 16 15:35:26 2015  (00:30)     91.194.227.251
g.bezruk pts/0        Fri Oct 16 14:59:22 2015 - Fri Oct 16 16:48:06 2015  (01:48)     91.194.227.251
g.bezruk pts/2        Fri Oct 16 11:55:48 2015 - Fri Oct 16 12:27:20 2015  (00:31)     91.194.227.251
g.bezruk pts/0        Fri Oct 16 11:27:21 2015 - Fri Oct 16 13:57:21 2015  (02:30)     91.194.227.251
g.bezruk pts/2        Thu Oct 15 18:56:47 2015 - Thu Oct 15 19:28:54 2015  (00:32)     91.194.227.251
g.bezruk pts/0        Thu Oct 15 18:40:04 2015 - Thu Oct 15 20:10:05 2015  (01:30)     91.194.227.251
g.bezruk pts/0        Thu Oct 15 17:49:05 2015 - Thu Oct 15 18:39:59 2015  (00:50)     91.194.227.251
g.bezruk pts/0        Thu Oct 15 15:18:53 2015 - Thu Oct 15 17:48:55 2015  (02:30)     91.194.227.251
g.bezruk pts/0        Thu Oct 15 14:19:21 2015 - Thu Oct 15 14:51:38 2015  (00:32)     91.194.227.251
g.bezruk pts/0        Thu Oct 15 11:39:27 2015 - Thu Oct 15 13:21:35 2015  (01:42)     91.194.227.251
g.bezruk pts/2        Wed Oct 14 14:57:43 2015 - Wed Oct 14 15:31:09 2015  (00:33)     91.194.227.251
g.bezruk pts/0        Wed Oct 14 14:40:57 2015 - Wed Oct 14 19:32:42 2015  (04:51)     91.194.227.251
g.bezruk pts/0        Wed Oct 14 12:44:33 2015 - Wed Oct 14 13:28:44 2015  (00:44)     91.194.227.251
g.bezruk pts/0        Tue Oct 13 14:09:14 2015 - Tue Oct 13 15:39:19 2015  (01:30)     91.194.227.251
g.bezruk pts/0        Tue Oct 13 12:51:22 2015 - Tue Oct 13 13:41:49 2015  (00:50)     91.194.227.251
g.bezruk pts/0        Tue Oct 13 12:02:27 2015 - Tue Oct 13 12:48:10 2015  (00:45)     91.194.227.251
g.bezruk pts/4        Tue Oct 13 10:54:56 2015 - Tue Oct 13 11:25:00 2015  (00:30)     91.194.227.251
g.bezruk pts/3        Tue Oct 13 10:54:56 2015 - Tue Oct 13 11:25:00 2015  (00:30)     91.194.227.251
g.bezruk pts/2        Tue Oct 13 10:54:56 2015 - Tue Oct 13 11:25:00 2015  (00:30)     91.194.227.251
g.bezruk pts/0        Tue Oct 13 10:54:56 2015 - Tue Oct 13 11:25:00 2015  (00:30)     91.194.227.251
g.bezruk pts/0        Mon Oct 12 12:39:34 2015 - Mon Oct 12 13:22:25 2015  (00:42)     91.194.227.251
g.bezruk pts/8        Mon Oct 12 10:57:31 2015 - Mon Oct 12 10:58:07 2015  (00:00)     91.194.227.251
g.bezruk pts/7        Mon Oct 12 10:57:31 2015 - Mon Oct 12 10:58:05 2015  (00:00)     91.194.227.251
g.bezruk pts/6        Mon Oct 12 10:57:31 2015 - Mon Oct 12 11:27:53 2015  (00:30)     91.194.227.251
g.bezruk pts/5        Mon Oct 12 10:57:31 2015 - Mon Oct 12 11:32:26 2015  (00:34)     91.194.227.251
g.bezruk pts/4        Mon Oct 12 10:57:31 2015 - Mon Oct 12 11:35:49 2015  (00:38)     91.194.227.251
g.bezruk pts/3        Mon Oct 12 10:57:31 2015 - Mon Oct 12 11:28:06 2015  (00:30)     91.194.227.251
g.bezruk pts/0        Mon Oct 12 10:57:31 2015 - Mon Oct 12 10:58:07 2015  (00:00)     91.194.227.251
g.bezruk pts/2        Mon Oct 12 10:57:31 2015 - Mon Oct 12 10:58:07 2015  (00:00)     91.194.227.251
g.bezruk pts/2        Fri Oct  9 16:18:03 2015 - Fri Oct  9 17:56:25 2015  (01:38)     91.194.227.251
g.bezruk pts/3        Fri Oct  9 14:53:34 2015 - Fri Oct  9 15:29:31 2015  (00:35)     91.194.227.251
g.bezruk pts/2        Fri Oct  9 14:08:29 2015 - Fri Oct  9 15:38:27 2015  (01:29)     91.194.227.251
g.bezruk pts/2        Fri Oct  9 10:49:49 2015 - Fri Oct  9 13:45:02 2015  (02:55)     91.194.227.251
g.bezruk pts/2        Thu Oct  8 20:21:05 2015 - Fri Oct  9 00:13:16 2015  (03:52)     91.194.227.251
g.bezruk pts/2        Thu Oct  8 17:10:21 2015 - Thu Oct  8 19:50:29 2015  (02:40)     91.194.227.251
root     pts/2        Thu Oct  8 15:31:00 2015 - Thu Oct  8 15:31:01 2015  (00:00)     91.194.227.99
g.bezruk pts/1        Thu Oct  8 14:48:56 2015 - Thu Oct  8 17:29:52 2015  (02:40)     91.194.227.251
g.bezruk pts/1        Thu Oct  8 11:25:05 2015 - Thu Oct  8 12:01:52 2015  (00:36)     91.194.227.251
g.bezruk pts/0        Wed Oct  7 19:12:03 2015 - Sun Oct 11 16:36:18 2015 (3+21:24)    91.194.227.251
g.bezruk pts/4        Wed Oct  7 15:53:39 2015 - Wed Oct  7 20:23:45 2015  (04:30)     91.194.227.251

wtmp begins Thu Oct  1 14:45:24 2015
root@pxr-bl ~ #

................................................................................

root@pxr-bl ~ # ls -Alh /var/log
total 220G
-rw-r--r-- 1 www-data root   6.8G Apr 18  2014 access_https_sync.log
-rw-r--r-- 1 www-data root   3.4G Apr 18  2014 access_https_syncsw.log
-rw-r--r-- 1 www-data root    55G Apr 18  2014 access_http_sync.log
-rw-r--r-- 1 www-data root    25G Apr 18  2014 access_http_syncsw.log
-rw-r--r-- 1 root     root    387 Oct  9 12:44 alternatives.log
-rw-r--r-- 1 root     root    412 Sep 29 11:48 alternatives.log.1
-rw-r--r-- 1 root     root    163 Sep 28 17:25 alternatives.log.2.gz
-rw-r--r-- 1 root     root    407 Oct  8  2014 alternatives.log.3.gz
-rw-r--r-- 1 root     root    172 Oct  6  2014 alternatives.log.4.gz
-rw-r--r-- 1 root     root    680 Feb 17  2014 alternatives.log.5.gz
drwxr-xr-x 2 root     root   4.0K Oct  1 06:25 apt
-rw-r--r-- 1 root     root    27K Oct  9 12:44 aptitude
-rw-r--r-- 1 root     root   1.3K Sep 29 11:48 aptitude.1.gz
-rw-r--r-- 1 root     root   1.4K Sep 28 18:27 aptitude.2.gz
-rw-r--r-- 1 root     root   1.2K Jul 10 11:33 aptitude.3.gz
drwxr-xr-x 2 root     root   4.0K Jan 28  2011 atop
-rw-r--r-- 1 root     root   598K Oct 21 19:34 atop.log
-rw-r--r-- 1 root     root   6.6K Oct 21 15:23 atop.log.1
-rw-r----- 1 syslog   adm    4.3M Oct 21 19:35 auth.log
-rw-r----- 1 syslog   adm    6.3M Oct 18 08:20 auth.log.1
-rw-r----- 1 syslog   adm    303K Oct 11 08:23 auth.log.2.gz
-rw-r----- 1 syslog   adm    289K Oct  4 06:28 auth.log.3.gz
-rw-r----- 1 syslog   adm    284K Sep 27 06:28 auth.log.4.gz
-rw-r----- 1 root     adm       0 Feb 12  2014 boot
-rw-r--r-- 1 root     root   4.6K Oct 21 14:01 boot.log
-rw-rw---- 1 root     utmp    384 Oct 21 13:42 btmp
-rw-rw---- 1 root     utmp      0 Sep  1 06:28 btmp.1
drwxr-xr-x 2 root     root   4.0K Nov  1  2014 ConsoleKit
drwxrwxrwx 2 root     root   4.0K Oct 21 00:00 diamond
drwxr-xr-x 2 root     root   4.0K Mar 13  2012 dist-upgrade
-rw-r----- 1 root     adm     68K Oct 21 14:00 dmesg
-rw-r----- 1 root     adm     68K Oct 21 13:25 dmesg.0
-rw-r----- 1 root     adm     16K Oct 21 13:22 dmesg.1.gz
-rw-r----- 1 root     adm     16K Oct 21 13:17 dmesg.2.gz
-rw-r----- 1 root     adm     15K Oct 21 12:29 dmesg.3.gz
-rw-r----- 1 root     adm     16K Oct 21 12:08 dmesg.4.gz
-rw-r--r-- 1 root     root   9.4K Oct 21 15:28 dpkg.log
-rw-r--r-- 1 root     root   1.4K Sep 29 11:48 dpkg.log.1
-rw-r--r-- 1 root     root    350 Aug 11  2014 dpkg.log.10.gz
-rw-r--r-- 1 root     root   1.1K Jun 27  2014 dpkg.log.11.gz
-rw-r--r-- 1 root     root    582 May 18  2014 dpkg.log.12.gz
-rw-r--r-- 1 root     root    851 Sep 28 18:27 dpkg.log.2.gz
-rw-r--r-- 1 root     root    639 Jul 10 11:33 dpkg.log.3.gz
-rw-r--r-- 1 root     root    370 Jun 30 11:16 dpkg.log.4.gz
-rw-r--r-- 1 root     root    222 Feb 16  2015 dpkg.log.5.gz
-rw-r--r-- 1 root     root    208 Nov 11  2014 dpkg.log.6.gz
-rw-r--r-- 1 root     root   5.4K Oct  8  2014 dpkg.log.7.gz
-rw-r--r-- 1 root     root    379 Sep 30  2014 dpkg.log.8.gz
-rw-r--r-- 1 root     root    213 Aug 13  2014 dpkg.log.9.gz
-rw-r--r-- 1 www-data root   221M Apr 18  2014 error_https_sync.log.log
-rw-r--r-- 1 www-data root   128G Apr 18  2014 error_https_syncsw.log.log
-rw-r--r-- 1 www-data root   2.2G Apr 18  2014 error_http_sync.log.log
-rw-r--r-- 1 www-data root      1 Apr 18  2014 error_http_syncsw.log.log
-rw-r----- 1 root     adm     13K Oct 21 02:28 fail2ban.log
-rw-r----- 1 root     adm     24K Oct 18 06:19 fail2ban.log.1
-rw-r----- 1 root     adm     693 Oct  5 00:30 fail2ban.log.2.gz
-rw-r----- 1 root     adm    4.1K Oct  4 06:11 fail2ban.log.3.gz
-rw-r----- 1 root     adm    5.4K Sep 27 05:55 fail2ban.log.4.gz
-rw-r--r-- 1 root     root   313K Sep 30 14:36 faillog
-rw-r--r-- 1 root     root    409 Oct  8  2014 fontconfig.log
drwxr-xr-x 2 root     root   4.0K Mar 15  2012 fsck
-rw-r----- 1 syslog   adm       0 Apr 18  2014 haproxy.log
-rw-r----- 1 syslog   adm    2.2M Oct 21 19:34 kern.log
-rw-r----- 1 syslog   adm    3.6K Oct 16 13:16 kern.log.1
-rw-r----- 1 syslog   adm     21K Oct  8 17:29 kern.log.2.gz
-rw-r----- 1 syslog   adm     998 Oct  1 11:58 kern.log.3.gz
-rw-r----- 1 syslog   adm     203 Sep 24 00:53 kern.log.4.gz
-rw-rw-r-- 1 root     utmp   2.8M Oct 21 19:03 lastlog
-rw-r----- 1 syslog   adm    2.0K Oct 21 13:59 mail.err
-rw-r----- 1 syslog   adm      97 Sep 29 10:48 mail.err.1
-rw-r----- 1 syslog   adm     81K Oct 21 15:14 mail.log
-rw-r----- 1 syslog   adm    866K Oct 18 06:25 mail.log.1
-rw-r----- 1 syslog   adm     943 Oct 11 06:25 mail.log.2.gz
-rw-r----- 1 syslog   adm    1.5K Oct  4 06:25 mail.log.3.gz
-rw-r----- 1 syslog   adm    1.6K Sep 27 06:25 mail.log.4.gz
drwxr-xr-x 2 root     root   4.0K Mar 15  2012 news
drwxr-xr-x 2 root     root    36K Oct 20 07:19 nginx
drwxr-xr-x 2 ntp      ntp    4.0K Mar  6  2012 ntpstats
drwxr-x--- 2 puppet   puppet 4.0K Jan  9  2014 puppet
-rw-r--r-- 1 root     root      0 Feb 17  2014 pycentral.log
-rw-r----- 1 syslog   adm    3.2M Oct 21 19:35 syslog
-rw-r----- 1 syslog   adm    893K Oct 20 07:19 syslog.1
-rw-r----- 1 syslog   adm     45K Oct 19 07:23 syslog.2.gz
-rw-r----- 1 syslog   adm     49K Oct 18 08:20 syslog.3.gz
-rw-r----- 1 syslog   adm     68K Oct 17 07:15 syslog.4.gz
-rw-r----- 1 syslog   adm     79K Oct 16 07:10 syslog.5.gz
-rw-r----- 1 syslog   adm     20K Oct 15 07:07 syslog.6.gz
-rw-r----- 1 syslog   adm    2.3K Oct 14 07:12 syslog.7.gz
drwxr-xr-x 2 root     root   4.0K Dec 16  2011 sysstat
-rw-r--r-- 1 root     root   357K Oct 21 14:00 udev
-rw-r----- 1 syslog   adm       0 Feb 12  2014 ufw.log
drwxr-xr-x 2 root     root   4.0K Nov 15  2012 unattended-upgrades
drwxr-xr-x 2 root     root   4.0K Oct 21 12:29 upstart
-rw-rw-r-- 1 root     utmp    99K Oct 21 19:31 wtmp
-rw-rw-r-- 1 root     utmp    16K Sep 30 14:38 wtmp.1
drwxr-xr-x 2 zabbix   zabbix 4.0K Oct 20 07:19 zabbix
drwxr-xr-x 2 zabbix   zabbix 4.0K Feb 17  2014 zabbix-agent
root@pxr-bl ~ # ls -Alh /var/log/sysstat/
total 0


#   I have seen that atop creates their own files and process.
#   And I remembered that we had problems with atop on our servers (log files were not rotated properly and other troubles) before.
#   So I have removed this package from server.
root@pxr-bl ~ # ps aux | grep atop
root      4501  0.0  0.0  16900  4616 ?        S<L  15:23   0:00 /usr/bin/atop -a -w /var/log/atop.log 600
root     13627  0.0  0.0   9396   940 pts/0    S+   19:36   0:00 grep --color=auto atop
root@pxr-bl ~ # apt-get remove atop
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
  atop
0 upgraded, 0 newly installed, 1 to remove and 145 not upgraded.
After this operation, 492 kB disk space will be freed.
Do you want to continue [Y/n]? y
(Reading database ... 59594 files and directories currently installed.)
Removing atop ...
Stopping atop system monitor: atop.
Processing triggers for ureadahead ...
Processing triggers for man-db ...
root@pxr-bl ~ #

................................................................................

root@bk1 ~ # grep -rl -e pxr-bl /etc/puppet/
/etc/puppet/manifests/nodes/sn.pp
/etc/puppet/backup/manifests/nodes/sn.pp
root@bk1 ~ #
root@bk1 ~ # grep -rli -e "148.251.1.147"  /etc/puppet/
/etc/puppet/dist/apps/iptables/rules.v4-simple
/etc/puppet/dist/apps/iptables/rules.v4-dsp-bl
/etc/puppet/dist/apps/iptables/rules.v4-dsp-bl-2
/etc/puppet/dist/apps/iptables/rules.v4-mongo-prime-t
/etc/puppet/dist/apps/iptables/rules.v4-dsp-bl-1
/etc/puppet/dist/apps/iptables/rules.v4-dsp
/etc/puppet/dist/apps/iptables/rules.v4-ui
/etc/puppet/dist/apps/iptables/rules.v4-dmp-bl
root@bk1 ~ #

root@bk1 ~ # grep -rli -e sysctl /etc/puppet/
/etc/puppet/manifests/site.pp
/etc/puppet/modules/cache/http_forge_puppetlabs_com-75a31f1d6f1ef6eb63b4479b3512ee1508209a7f/duritong-sysctl-0.0.1.tar.gz
/etc/puppet/modules/sysctl/manifests/init.pp
/etc/puppet/modules/sysctl/files/sysctl.conf-CentOS
/etc/puppet/modules/sysctl/files/sysctl.conf-Ubuntu.bak
/etc/puppet/modules/sysctl/tests/init.pp
/etc/puppet/modules/sysctl/metadata.json
/etc/puppet/modules/sysctl/README
/etc/puppet/modules/sysctl/REVISION
/etc/puppet/modules/sysctl/Modulefile
/etc/puppet/backup/manifests/site.pp
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/redis-benchmark
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/redis-server
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/zookeeper/src/c/configure
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/zookeeper/src/c/autom4te.cache/traces.0
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/zookeeper/src/c/autom4te.cache/output.1
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/zookeeper/src/c/autom4te.cache/output.0
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/zookeeper/src/c/config.guess
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/zookeeper/src/c/aclocal.m4
/etc/puppet/dist/apps/dsp/dsp-home/local/bin/redis-cli
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-lynxos.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-tandem-nsk-mips-v3.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-sunos5.5.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-freebsd.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-macosx.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-qnx.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-openvms.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-netbsd.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/os_include/sys/os_sysctl.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-kfreebsd.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-aix-5.x.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-hpux-11.00.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-cygwin32.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-vxworks6.4.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-posix-nonetworking.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-hurd.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-win32-common.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-win32-interix.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/ace/config-openbsd.h
/etc/puppet/dist/apps/dsp/dsp-home/local/include/boost/interprocess/shared_memory_object.hpp
/etc/puppet/dist/apps/dsp/dsp-home/local/include/boost/interprocess/detail/tmp_dir_helpers.hpp
/etc/puppet/dist/apps/dsp/dsp-home/local/include/boost/interprocess/detail/workaround.hpp
/etc/puppet/dist/apps/dsp/dsp-home/local/lib/node/wafadmin/Options.py
/etc/puppet/dist/apps/dsp/dsp-home/local/lib/node/wafadmin/Options.pyc
/etc/puppet/dist/sysctl/manifests/value.pp
/etc/puppet/dist/sysctl/metadata.json
/etc/puppet/dist/sysctl/README
/etc/puppet/dist/sysctl/REVISION
/etc/puppet/dist/sysctl/Modulefile
/etc/puppet/dist/sysctl/lib/puppet/provider/sysctl/parsed.rb
/etc/puppet/dist/sysctl/lib/puppet/type/sysctl.rb
root@bk1 ~ #


# Class: sysctl
#
# This module manages sysctl, which is included in the $operatingsystem module
#
class sysctl {

    # look for a host specific version, then an OS specific version
    file { "/etc/sysctl.conf":
        source => [ "puppet:///modules/sysctl/sysctl.conf-$fqdn", "puppet:///modules/sysctl/sysctl.conf-$operatingsystem" ],
        mode   => "640",
        notify => Exec["reload sysctl"],
        links  => follow,
    } # file

    exec{ "reload sysctl":
        command     => "/sbin/sysctl -p",
        refreshonly => "true",
    } # exec
} # class sysctl


root@bk1 ~ # ls -Alh /etc/puppet/modules/sysctl/files/
total 20K
-rw-r--r-- 1 root root 5.0K Jan 15  2014 sysctl.conf-CentOS
-rw-r--r-- 1 root root 1.8K Mar 30  2015 sysctl.conf-Ubuntu
-rw-r--r-- 1 root root 5.2K Jan 15  2014 sysctl.conf-Ubuntu.bak
root@bk1 ~ #

................................................................................
................................................................................

root@pxr-bl ~ # puppet agent -t -v
info: Caching catalog for pxr-bl.datamind.ru
info: Applying configuration version '1441692721'
notice: /Stage[main]/Ulimits/File[/etc/security/limits.conf]/content:
--- /etc/security/limits.conf   2015-10-21 15:22:32.480317788 +0300
+++ /tmp/puppet-file20151022-5736-g0pp0q-0      2015-10-22 12:48:24.127104832 +0300
@@ -61,8 +61,4 @@
 * hard nproc 131072
 root soft nofile 131000
 root hard nofile 131000
-www-data soft nofile 1000000
-www-data hard nofile 1000000
-www-data soft nproc unlimited
-www-data hard nproc unlimited
 # End of file

info: FileBucket adding {md5}2d81faf36485a24c17780968eea27d7d
info: /Stage[main]/Ulimits/File[/etc/security/limits.conf]: Filebucketed /etc/security/limits.conf to puppet with sum 2d81faf36485a24c17780968eea27d7d
notice: /Stage[main]/Ulimits/File[/etc/security/limits.conf]/content: content changed '{md5}2d81faf36485a24c17780968eea27d7d' to '{md5}41d80b77937c2131c773657d951b44fe'
notice: /Stage[main]//Node[default]/Service[puppet]/ensure: ensure changed 'stopped' to 'running'
notice: /Stage[main]/Sysctl/File[/etc/sysctl.conf]/content:
--- /etc/sysctl.conf    2015-10-21 15:25:40.115527857 +0300
+++ /tmp/puppet-file20151022-5736-1ahaz6n-0     2015-10-22 12:48:26.415091769 +0300
@@ -10,15 +10,13 @@

 vm.swappiness=0

-fs.file-max = 26281780
+fs.file-max = 100000

 net.ipv6.conf.all.disable_ipv6 = 1
 net.ipv6.conf.default.disable_ipv6 = 1
 net.ipv6.conf.lo.disable_ipv6 = 1


-net.ipv4.tcp_syn_retries=2
-net.ipv4.tcp_fastopen=0
 net.ipv4.conf.all.accept_redirects=0
 net.ipv4.conf.all.secure_redirects=0
 net.ipv4.conf.all.send_redirects=0
@@ -31,16 +29,14 @@
 net.ipv4.conf.eth0.accept_source_route=0
 net.ipv4.conf.default.accept_source_route=0

-net.ipv4.tcp_slow_start_after_idle=0
 net.ipv4.tcp_max_orphans=65536
 net.ipv4.tcp_fin_timeout=10
 net.ipv4.tcp_keepalive_time=1800
 net.ipv4.tcp_keepalive_intvl=15
 net.ipv4.tcp_keepalive_probes=5
-#net.ipv4.tcp_max_syn_backlog=4096
-net.ipv4.tcp_max_syn_backlog=131070
+net.ipv4.tcp_max_syn_backlog=4096
 net.ipv4.tcp_synack_retries=1
-net.ipv4.tcp_mem=50576   64768   196304
+net.ipv4.tcp_mem=50576   64768   98152
 net.ipv4.tcp_rmem=4096 87380 16777216
 net.ipv4.tcp_wmem=4096 65536 16777216
 net.ipv4.tcp_orphan_retries=0
@@ -49,8 +45,7 @@
 net.ipv4.tcp_sack=1
 net.ipv4.tcp_congestion_control=htcp
 net.ipv4.tcp_no_metrics_save=1
-net.ipv4.tcp_tw_reuse=0
-net.ipv4.tcp_tw_recycle=0
+net.ipv4.tcp_tw_reuse=1
 net.ipv4.tcp_window_scaling=1
 net.ipv4.tcp_rfc1337=1

@@ -59,9 +54,8 @@
 net.ipv4.icmp_echo_ignore_all=0
 net.ipv4.icmp_ignore_bogus_error_responses=1

-net.core.somaxconn=65535
-#net.core.netdev_max_backlog=1000
-net.core.netdev_max_backlog=131070
+net.core.somaxconn=15000
+net.core.netdev_max_backlog=1000
 net.core.rmem_default=65536
 net.core.wmem_default=65536
 net.core.rmem_max=16777216
@@ -70,6 +64,5 @@
 #net.ipv4.netfilter.ip_conntrack_max = 4548576
 net.netfilter.nf_conntrack_max = 4548576
 net.nf_conntrack_max = 4548576
-net.netfilter.nf_conntrack_tcp_timeout_time_wait = 10

 kernel.core_pattern = core.%e.%p

info: FileBucket adding {md5}126c2735d68a66fa9b2bbfe5b0d3746a
info: /Stage[main]/Sysctl/File[/etc/sysctl.conf]: Filebucketed /etc/sysctl.conf to puppet with sum 126c2735d68a66fa9b2bbfe5b0d3746a
notice: /Stage[main]/Sysctl/File[/etc/sysctl.conf]/content: content changed '{md5}126c2735d68a66fa9b2bbfe5b0d3746a' to '{md5}e9c4ab479459142fea6e568c81a40b7d'
info: /Stage[main]/Sysctl/File[/etc/sysctl.conf]: Scheduling refresh of Exec[reload sysctl]
notice: /Stage[main]/Sysctl/Exec[reload sysctl]: Triggered 'refresh' from 1 events
notice: Finished catalog run in 3.73 seconds
root@pxr-bl ~ #

................................................................................

root@bk1 /etc/puppet/modules/sysctl/files # cat /etc/puppet/manifests/classes/ulimit.pp
class ulimits {

    file { "/etc/security/limits.conf":
        owner => "root",
        group => "root",
        mode => 644,
        checksum => md5,
        source => "puppet://puppet/dist/apps/ulimit/limits.conf",
    }

    file { "/etc/pam.d/common-session":
        owner => "root",
        group => "root",
        mode => 644,
        checksum => md5,
        source => "puppet://puppet/dist/apps/ulimit/common-session",
    }
}

root@bk1 /etc/puppet/modules/sysctl/files #


root@bk1 /etc/puppet/modules/sysctl/files # cat  /etc/puppet/dist/apps/ulimit/limits.conf
# /etc/security/limits.conf
#
#Each line describes a limit for a user in the form:
#
#<domain>        <type>  <item>  <value>
#
#Where:
#<domain> can be:
#        - an user name
#        - a group name, with @group syntax
#        - the wildcard *, for default entry
#        - the wildcard %, can be also used with %group syntax,
#                 for maxlogin limit
#        - NOTE: group and wildcard limits are not applied to root.
#          To apply a limit to the root user, <domain> must be
#          the literal username root.
#
#<type> can have the two values:
#        - "soft" for enforcing the soft limits
#        - "hard" for enforcing hard limits
#
#<item> can be one of the following:
#        - core - limits the core file size (KB)
#        - data - max data size (KB)
#        - fsize - maximum filesize (KB)
#        - memlock - max locked-in-memory address space (KB)
#        - nofile - max number of open files
#        - rss - max resident set size (KB)
#        - stack - max stack size (KB)
#        - cpu - max CPU time (MIN)
#        - nproc - max number of processes
#        - as - address space limit (KB)
#        - maxlogins - max number of logins for this user
#        - maxsyslogins - max number of logins on the system
#        - priority - the priority to run user process with
#        - locks - max number of file locks the user can hold
#        - sigpending - max number of pending signals
#        - msgqueue - max memory used by POSIX message queues (bytes)
#        - nice - max nice priority allowed to raise to values: [-20, 19]
#        - rtprio - max realtime priority
#        - chroot - change root to directory (Debian-specific)
#
#<domain>      <type>  <item>         <value>
#

#*               soft    core            0
#root            hard    core            100000
#*               hard    rss             10000
#@student        hard    nproc           20
#@faculty        soft    nproc           20
#@faculty        hard    nproc           50
#ftp             hard    nproc           0
#ftp             -       chroot          /ftp
#@student        -       maxlogins       4

* soft core unlimited
* hard core unlimited
* soft nofile 131000
* hard nofile 131000
* soft nproc 131072
* hard nproc 131072
root soft nofile 131000
root hard nofile 131000
# End of file
root@bk1 /etc/puppet/modules/sysctl/files #

................................................................................

#   Here is modified by me file, that apply limits parameters.
#   I have modified line with sourse statment similar as puppet file for sysctl.conf.
root@bk1 /etc/puppet/modules/sysctl/files # cat /etc/puppet/manifests/classes/ulimit.pp
class ulimits {

    # At the first - look for a host specific version if it absent apply common for all hosts version
    file { "/etc/security/limits.conf":
        owner => "root",
        group => "root",
        mode => 644,
        checksum => md5,
        source => [ "puppet://puppet/dist/apps/ulimit/limits.conf-$fqdn", "puppet://puppet/dist/apps/ulimit/limits.conf" ],
    }

    file { "/etc/pam.d/common-session":
        owner => "root",
        group => "root",
        mode => 644,
        checksum => md5,
        source => "puppet://puppet/dist/apps/ulimit/common-session",
    }
}

root@bk1 /etc/puppet/modules/sysctl/files #

#   This is working part of file, that was created by me, exactly for server pxr-bl.datamind.ru
root@bk1 /etc/puppet/modules/sysctl/files # tail -n 15 /etc/puppet/dist/apps/ulimit/limits.conf-pxr-bl.datamind.ru
#@faculty        soft    nproc           20
#@faculty        hard    nproc           50
#ftp             hard    nproc           0
#ftp             -       chroot          /ftp
#@student        -       maxlogins       4

* soft core unlimited
* hard core unlimited
* soft nofile 100000
* hard nofile 100000
* soft nproc 32000
* hard nproc 32000
www-data soft nofile 200000
www-data hard nofile 200000
# End of file
root@bk1 /etc/puppet/modules/sysctl/files #

#   This is working parts of common file.
root@bk1 /etc/puppet/modules/sysctl/files # tail -n 15 /etc/puppet/dist/apps/ulimit/limits.conf
#@faculty        soft    nproc           20
#@faculty        hard    nproc           50
#ftp             hard    nproc           0
#ftp             -       chroot          /ftp
#@student        -       maxlogins       4

* soft core unlimited
* hard core unlimited
* soft nofile 131000
* hard nofile 131000
* soft nproc 131072
* hard nproc 131072
root soft nofile 131000
root hard nofile 131000
# End of file
root@bk1 /etc/puppet/modules/sysctl/files #

................................................................................

bsv@bk1:~$ sshpass -e ssh -t -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@pxr-bl.datamind.ru
There is need access to lara069:443 port to allow KVM works.





