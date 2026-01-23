

Задача для unix-admins
Ранее заводилась SD 264228. Но решение по этой SD не помогло в исправлении ситуации.
Ежедневно в 04:00 vm-insite04p чем-то нагружена:
долгий отклик по порту 80 => затем ошибка apache 500.
Сервер самовосстанавливается в течение 5-15 минут.
В Nagios никаких признаков нарушения работы нет.
Всплески видны в monitorix http://vm-insite04p:8080/monitorix-cgi/monitorix.cgi?mode=localhost&graph=all&when=1day&color=black

................................................................................

#   SD#264228.
#   Previous.
http://sd.tcsbank.ru/0/Nui/ViewModule.aspx#SectionModuleV2/CaseSection/CasePage/edit/a3eb4229-3cb3-4552-8b14-1536be4d4763

................................................................................

[root@vm-insite04p ~]# cat /etc/system-release
CentOS Linux release 7.3.1611 (Core)
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# ls -Alh /var/coredumps/
total 0
[root@vm-insite04p ~]# ls -Alh /var/crash/
total 0
[root@vm-insite04p ~]#

................................................................................

[root@vm-insite04p ~]# yum install sysstat
Loaded plugins: auto-update-debuginfo
Resolving Dependencies
--> Running transaction check
---> Package sysstat.x86_64 0:10.1.5-11.el7 will be installed
--> Processing Dependency: libsensors.so.4()(64bit) for package: sysstat-10.1.5-11.el7.x86_64
--> Running transaction check
---> Package lm_sensors-libs.x86_64 0:3.4.0-4.20160601gitf9185e5.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

============================================================================================================================================================================================================
 Package                                           Arch                                     Version                                                            Repository                              Size
============================================================================================================================================================================================================
Installing:
 sysstat                                           x86_64                                   10.1.5-11.el7                                                      base                                   310 k
Installing for dependencies:
 lm_sensors-libs                                   x86_64                                   3.4.0-4.20160601gitf9185e5.el7                                     base                                    41 k

Transaction Summary
============================================================================================================================================================================================================
Install  1 Package (+1 Dependent package)

Total download size: 351 k
Installed size: 1.2 M
Is this ok [y/d/N]: y
Downloading packages:
(1/2): lm_sensors-libs-3.4.0-4.20160601gitf9185e5.el7.x86_64.rpm                                                                                                                     |  41 kB  00:00:00
(2/2): sysstat-10.1.5-11.el7.x86_64.rpm                                                                                                                                              | 310 kB  00:00:00
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                                       1.1 MB/s | 351 kB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : lm_sensors-libs-3.4.0-4.20160601gitf9185e5.el7.x86_64                                                                                                                                    1/2
  Installing : sysstat-10.1.5-11.el7.x86_64                                                                                                                                                             2/2
  Verifying  : sysstat-10.1.5-11.el7.x86_64                                                                                                                                                             1/2
  Verifying  : lm_sensors-libs-3.4.0-4.20160601gitf9185e5.el7.x86_64                                                                                                                                    2/2

Installed:
  sysstat.x86_64 0:10.1.5-11.el7

Dependency Installed:
  lm_sensors-libs.x86_64 0:3.4.0-4.20160601gitf9185e5.el7

Complete!
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# systemctl status sysstat
● sysstat.service - Resets System Activity Logs
   Loaded: loaded (/usr/lib/systemd/system/sysstat.service; enabled; vendor preset: enabled)
   Active: inactive (dead)
[root@vm-insite04p ~]# systemctl start sysstat
[root@vm-insite04p ~]# systemctl status sysstat
● sysstat.service - Resets System Activity Logs
   Loaded: loaded (/usr/lib/systemd/system/sysstat.service; enabled; vendor preset: enabled)
   Active: active (exited) since Thu 2017-03-16 15:06:56 MSK; 3s ago
  Process: 24307 ExecStart=/usr/lib64/sa/sa1 --boot (code=exited, status=0/SUCCESS)
 Main PID: 24307 (code=exited, status=0/SUCCESS)

Mar 16 15:06:55 vm-insite04p.tcsbank.ru systemd[1]: Starting Resets System Activity Logs...
Mar 16 15:06:56 vm-insite04p.tcsbank.ru systemd[1]: Started Resets System Activity Logs.
[root@vm-insite04p ~]#

................................................................................

[root@vm-insite04p ~]# last reboot -a -d -F -x -n 10
reboot   system boot  Mon Mar 13 23:07:12 2017 - Thu Mar 16 15:11:17 2017 (2+16:04)    0.0.0.0
reboot   system boot  Tue Mar  7 10:31:31 2017 - Mon Mar 13 23:06:24 2017 (6+12:34)    0.0.0.0
reboot   system boot  Tue Mar  7 10:29:47 2017 - Tue Mar  7 10:31:14 2017  (00:01)     0.0.0.0
reboot   system boot  Fri Feb 17 16:04:55 2017 - Tue Mar  7 10:29:27 2017 (17+18:24)   0.0.0.0
reboot   system boot  Thu Feb 16 16:49:47 2017 - Tue Mar  7 10:29:27 2017 (18+17:39)   0.0.0.0
reboot   system boot  Mon Feb 13 10:38:27 2017 - Thu Feb 16 16:49:26 2017 (3+06:10)    0.0.0.0
reboot   system boot  Fri Feb 10 18:23:40 2017 - Thu Feb 16 16:49:26 2017 (5+22:25)    0.0.0.0
reboot   system boot  Fri Feb 10 09:52:38 2017 - Thu Feb 16 16:49:26 2017 (6+06:56)    0.0.0.0
reboot   system boot  Fri Feb 10 09:40:13 2017 - Fri Feb 10 09:52:20 2017  (00:12)     0.0.0.0
reboot   system boot  Thu Feb  9 16:15:38 2017 - Fri Feb 10 09:52:20 2017  (17:36)     0.0.0.0

wtmp begins Wed Feb  8 11:52:30 2017
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# free -h -m
              total        used        free      shared  buff/cache   available
Mem:            19G         12G        295M        1.1G        6.4G        4.7G
Swap:            0B          0B          0B
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# w
 15:18:33 up 2 days, 16:11,  5 users,  load average: 2.73, 2.49, 2.33
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
n.ekimov pts/0    tcs7323.tcsbank. Tue17    8:17   5.18s  0.97s sshd: n.ekimov [priv]
n.ekimov pts/1    tcs7323.tcsbank. 13:22    1:51m  0.05s  0.05s -bash
a.leonov pts/2    tcs6020.tcsbank. Tue10   29:23m  0.32s  0.46s sshd: a.leonov [priv]
che      pts/3    tcs5368.tcsbank. 11:13    3:58m  1.09s  0.26s sshd: che [priv]
bsv      pts/4    tcs4500.tcsbank. 14:25    1.00s  0.59s  0.36s sshd: bsv [priv]
[root@vm-insite04p ~]#
[root@vm-insite04p ~]# last -a -d -F -x -n 10
bsv      pts/4        Thu Mar 16 14:25:57 2017   still logged in                       tcs4500.tcsbank.ru
n.ekimov pts/1        Thu Mar 16 13:22:03 2017   still logged in                       tcs7323.tcsbank.ru
che      pts/3        Thu Mar 16 11:13:36 2017   still logged in                       tcs5368.tcsbank.ru
n.ekimov pts/1        Thu Mar 16 10:49:10 2017 - Thu Mar 16 13:21:30 2017  (02:32)     tcs7323.tcsbank.ru
root     pts/1        Wed Mar 15 13:54:43 2017 - Wed Mar 15 14:14:58 2017  (00:20)     tcs6154.tcsbank.ru
n.ekimov pts/0        Tue Mar 14 17:27:07 2017   still logged in                       tcs7323.tcsbank.ru
che      pts/4        Tue Mar 14 10:09:10 2017 - Wed Mar 15 11:14:42 2017 (1+01:05)    tcs5368.tcsbank.ru
root     pts/3        Tue Mar 14 10:05:58 2017 - Tue Mar 14 17:01:38 2017  (06:55)     tcs6154.tcsbank.ru
a.leonov pts/2        Tue Mar 14 10:02:25 2017   still logged in                       tcs6020.tcsbank.ru
n.ekimov pts/1        Mon Mar 13 23:09:21 2017 - Tue Mar 14 16:54:48 2017  (17:45)     tcs7323.tcsbank.ru

wtmp begins Wed Feb  8 11:52:30 2017
[root@vm-insite04p ~]#


#
#   There is no swap on this server.
#
[root@vm-insite04p ~]# free -h -m
              total        used        free      shared  buff/cache   available
Mem:            19G         10G        5.5G        1.1G        3.3G        6.7G
Swap:            0B          0B          0B
[root@vm-insite04p ~]# swapo
swapoff  swapon
[root@vm-insite04p ~]# swapo
swapoff  swapon
[root@vm-insite04p ~]# swapon -s
[root@vm-insite04p ~]# cat /proc/swaps
Filename                                Type            Size    Used    Priority
[root@vm-insite04p ~]#



[root@vm-insite04p ~]# pstree -h -p -u -a | head -n 30
systemd,1 --system --deserialize 22
  |-/usr/bin/monito,10252
  |   `-monitorix-httpd,10314,nobody
  |-agetty,1062 --noclear tty1 linux
  |-auditd,665 -n
  |   `-{auditd},684
  |-crond,1030 -n
  |-dbus-daemon,697,dbus --system --address=systemd: --nofork --nopidfile --systemd-activation
  |   `-{dbus-daemon},705
  |-gssproxy,698 -D
  |   |-{gssproxy},699
  |   |-{gssproxy},700
  |   |-{gssproxy},701
  |   |-{gssproxy},702
  |   `-{gssproxy},703
  |-httpd,15472 -DFOREGROUND
  |   |-httpd,15833,apache -DFOREGROUND
  |   |-httpd,16097,apache -DFOREGROUND
  |   |-httpd,17000,apache -DFOREGROUND
  |   |-httpd,17068,apache -DFOREGROUND
  |   |-httpd,17402,apache -DFOREGROUND
  |   |-httpd,17869,apache -DFOREGROUND
  |   |-httpd,17896,apache -DFOREGROUND
  |   |-httpd,17962,apache -DFOREGROUND
  |   |-httpd,18167,apache -DFOREGROUND
  |   |-httpd,18526,apache -DFOREGROUND
  |   |-httpd,18736,apache -DFOREGROUND
  |   |-httpd,18771,apache -DFOREGROUND
  |   |-httpd,19120,apache -DFOREGROUND
  |   |-httpd,19141,apache -DFOREGROUND
[root@vm-insite04p ~]#

#
#   Apache server has 1417 threads process.
#
[root@vm-insite04p ~]# pstree | head -n 30
systemd-+-/usr/bin/monito---monitorix-httpd
        |-agetty
        |-auditd---{auditd}
        |-crond
        |-dbus-daemon---{dbus-daemon}
        |-gssproxy---5*[{gssproxy}]
        |-httpd---1417*[httpd]
        |-irqbalance
        |-lvmetad
        |-master-+-pickup
        |        `-qmgr
        |-nrpe
        |-ntpd
        |-polkitd---5*[{polkitd}]
        |-rpc.gssd
        |-rpc.statd
        |-rpcbind
        |-rsyslogd---2*[{rsyslogd}]
        |-smbd-+-cleanupd
        |      |-lpqd
        |      |-36*[smbd]
        |      `-smbd-notifyd
        |-sshd-+-sshd---sshd---bash---sudo---bash---dmesg---less
        |      |-sshd---sshd---bash
        |      |-sshd---sshd
        |      |-sshd---sshd---bash---sudo---bash-+-head
        |      |                                  `-pstree
        |      |-sshd---sshd---bash---sudo---su---bash
        |      `-sshd---sshd---bash---sudo---su---bash---less
        |-start-puppet-ag---puppet---{puppet}
[root@vm-insite04p ~]#

................................................................................

#
#   Server was hanged up.
#   After server was rebooted.
#   Kokhlachev Sergey added memory to it.
#

[support@centos00 ~]$ SSHPASS="$(pass common/linux)" sshpass -e ssh -t -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@vm-insite04p
Last login: Thu Mar 16 14:25:57 2017 from tcs4500.tcsbank.ru
[bsv@vm-insite04p ~]$ pstree | head -n 30
systemd-+-agetty
        |-auditd---{auditd}
        |-crond
        |-dbus-daemon---{dbus-daemon}
        |-gssproxy---5*[{gssproxy}]
        |-httpd---1313*[httpd]
        |-irqbalance
        |-lvmetad
        |-nrpe
        |-ntpd
        |-polkitd---5*[{polkitd}]
        |-rpc.gssd
        |-rsyslogd---2*[{rsyslogd}]
        |-2*[sendmail]
        |-smbd-+-cleanupd
        |      |-lpqd
        |      |-7*[smbd]
        |      `-smbd-notifyd
        |-sshd---sshd---sshd---bash-+-head
        |                           `-pstree
        |-start-puppet-ag---puppet-+-puppet---{puppet}
        |                          `-{puppet}
        |-systemd-journal
        |-systemd-logind
        |-systemd-udevd
        |-tuned---4*[{tuned}]
        |-vmtoolsd---{vmtoolsd}
        `-winbindd---6*[winbindd]
[bsv@vm-insite04p ~]$

[bsv@vm-insite04p ~]$ free -hm
              total        used        free      shared  buff/cache   available
Mem:            31G         10G         19G        106M        1.4G         20G
Swap:            0B          0B          0B
[bsv@vm-insite04p ~]$


[bsv@vm-insite04p ~]$ pstree | grep httpd
        |-httpd---1423*[httpd]
[bsv@vm-insite04p ~]$

[bsv@vm-insite04p ~]$ ps aux | grep apache | wc -l
1356
[bsv@vm-insite04p ~]$

................................................................................



...
Mar 16 16:42:37 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 16:42:37 vm-insite04p kernel: httpd cpuset=/ mems_allowed=0
Mar 16 16:42:37 vm-insite04p kernel: CPU: 1 PID: 2885 Comm: httpd Not tainted 3.10.0-514.6.1.el7.x86_64 #1
Mar 16 16:42:37 vm-insite04p kernel: Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 04/14/2014
Mar 16 16:42:37 vm-insite04p kernel: ffff88018f77edd0 00000000cf2f7d62 ffff88001180fa78 ffffffff816862ac
Mar 16 16:42:37 vm-insite04p kernel: ffff88001180fb08 ffffffff81681257 ffffffff812ae86b ffff8804b22f31a0
Mar 16 16:42:37 vm-insite04p kernel: ffff8804b22f31b8 31a414ff00000202 fbfeffff00000000 0000000000000001
Mar 16 16:42:37 vm-insite04p kernel: Call Trace:
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff816862ac>] dump_stack+0x19/0x1b
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff81681257>] dump_header+0x8e/0x225
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff812ae86b>] ? cred_has_capability+0x6b/0x120
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff8113cc03>] ? uts_proc_notify+0x3/0x20
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff8118475e>] oom_kill_process+0x24e/0x3c0
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff810937ee>] ? has_capability_noaudit+0x1e/0x30
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff81184f96>] out_of_memory+0x4b6/0x4f0
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff81681d60>] __alloc_pages_slowpath+0x5d7/0x725
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff8118b0a5>] __alloc_pages_nodemask+0x405/0x420
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff811d220a>] alloc_pages_vma+0x9a/0x150
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff811b14cf>] handle_mm_fault+0xc6f/0xfe0
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff81691d94>] __do_page_fault+0x154/0x450
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff816920c5>] do_page_fault+0x35/0x90
Mar 16 16:42:37 vm-insite04p kernel: [<ffffffff8168e388>] page_fault+0x28/0x30
...


[root@vm-insite04p ~]# grep -e "Out of memory" /var/log/messages
Mar 15 12:11:27 vm-insite04p kernel: Out of memory: Kill process 24311 (winbindd) score 7 or sacrifice child
Mar 15 12:12:41 vm-insite04p kernel: Out of memory: Kill process 16045 (httpd) score 5 or sacrifice child
Mar 15 12:12:41 vm-insite04p kernel: Out of memory: Kill process 1627 (winbindd) score 5 or sacrifice child
Mar 15 12:12:42 vm-insite04p kernel: Out of memory: Kill process 1627 (winbindd) score 5 or sacrifice child
Mar 15 13:02:10 vm-insite04p kernel: Out of memory: Kill process 29049 (httpd) score 11 or sacrifice child
Mar 15 13:38:22 vm-insite04p kernel: Out of memory: Kill process 26920 (winbindd) score 7 or sacrifice child
Mar 15 13:38:23 vm-insite04p kernel: Out of memory: Kill process 26920 (winbindd) score 7 or sacrifice child
Mar 15 13:38:23 vm-insite04p kernel: Out of memory: Kill process 26920 (winbindd) score 7 or sacrifice child
Mar 15 13:38:24 vm-insite04p kernel: Out of memory: Kill process 26920 (winbindd) score 7 or sacrifice child
Mar 15 13:39:50 vm-insite04p kernel: Out of memory: Kill process 2555 (httpd) score 3 or sacrifice child
Mar 15 13:40:54 vm-insite04p kernel: Out of memory: Kill process 488 (httpd) score 2 or sacrifice child
Mar 15 13:40:54 vm-insite04p kernel: Out of memory: Kill process 1284 (httpd) score 2 or sacrifice child
Mar 15 13:40:55 vm-insite04p kernel: Out of memory: Kill process 27959 (httpd) score 2 or sacrifice child
Mar 15 13:40:56 vm-insite04p kernel: Out of memory: Kill process 1517 (httpd) score 2 or sacrifice child
Mar 15 13:40:56 vm-insite04p kernel: Out of memory: Kill process 30473 (httpd) score 2 or sacrifice child
Mar 15 13:40:56 vm-insite04p kernel: Out of memory: Kill process 2183 (httpd) score 2 or sacrifice child
Mar 15 13:41:00 vm-insite04p kernel: Out of memory: Kill process 30708 (httpd) score 2 or sacrifice child
Mar 16 15:20:06 vm-insite04p kernel: Out of memory: Kill process 24142 (httpd) score 9 or sacrifice child
Mar 16 15:20:08 vm-insite04p kernel: Out of memory: Kill process 23649 (httpd) score 9 or sacrifice child
Mar 16 15:20:12 vm-insite04p kernel: Out of memory: Kill process 15938 (httpd) score 9 or sacrifice child
Mar 16 15:20:15 vm-insite04p kernel: Out of memory: Kill process 15937 (httpd) score 8 or sacrifice child
Mar 16 15:20:21 vm-insite04p kernel: Out of memory: Kill process 13571 (winbindd) score 7 or sacrifice child
Mar 16 15:20:28 vm-insite04p kernel: Out of memory: Kill process 9473 (winbindd) score 7 or sacrifice child
Mar 16 15:20:29 vm-insite04p kernel: Out of memory: Kill process 9473 (winbindd) score 7 or sacrifice child
Mar 16 15:20:47 vm-insite04p kernel: Out of memory: Kill process 9473 (winbindd) score 7 or sacrifice child
Mar 16 15:20:48 vm-insite04p kernel: Out of memory: Kill process 9473 (winbindd) score 7 or sacrifice child
Mar 16 15:20:48 vm-insite04p kernel: Out of memory: Kill process 9473 (winbindd) score 7 or sacrifice child
Mar 16 15:28:41 vm-insite04p kernel: Out of memory: Kill process 23692 (httpd) score 9 or sacrifice child
Mar 16 15:28:46 vm-insite04p kernel: Out of memory: Kill process 24934 (httpd) score 9 or sacrifice child
Mar 16 16:00:52 vm-insite04p kernel: Out of memory: Kill process 24501 (httpd) score 10 or sacrifice child
Mar 16 16:20:35 vm-insite04p kernel: Out of memory: Kill process 29189 (httpd) score 10 or sacrifice child
[root@vm-insite04p ~]#


[root@vm-insite04p ~]# last | tail -n 1
wtmp begins Wed Feb  8 11:52:30 2017
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# ls -Alh /var/log/messages
-rw-------. 1 root root 405M Mar 16 18:01 /var/log/messages
[root@vm-insite04p ~]#


[root@vm-insite04p ~]# grep -e "^Mar 16 16:" /var/log/messages > /tmp/20170316.vm-insite04p.var.log.messages.log
[root@vm-insite04p ~]# ls -Alh !$
ls -Alh /tmp/20170316.vm-insite04p.var.log.messages.log
-rw-r--r--. 1 root root 973K Mar 16 18:12 /tmp/20170316.vm-insite04p.var.log.messages.log
[root@vm-insite04p ~]#


[root@vm-insite04p ~]# grep -e "oom-kill" /var/log/messages
Mar 15 12:11:26 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 12:12:41 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 12:12:41 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 12:12:42 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:02:09 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:37:58 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x200d0, order=0, oom_score_adj=0
Mar 15 13:38:22 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:38:23 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:38:23 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x200da, order=0, oom_score_adj=0
Mar 15 13:38:24 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x200d0, order=0, oom_score_adj=0
Mar 15 13:40:54 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:40:54 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:40:55 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:40:56 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:40:56 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:40:56 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 15 13:41:26 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:06 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:08 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:12 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:15 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:21 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:28 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:29 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x200da, order=0, oom_score_adj=0
Mar 16 15:20:35 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:47 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:48 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:20:48 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:28:41 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 15:28:46 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 16:00:52 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 16:20:35 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 16:42:37 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# tar -czf /tmp/20170316.vm-insite04p.var.log.httpd.tgz /var/log/httpd/
tar: Removing leading `/' from member names
[root@vm-insite04p ~]# ls -Alh /tmp/20170316.vm-insite04p.var.log.httpd.tgz
-rw-r--r--. 1 root root 23M Mar 16 18:52 /tmp/20170316.vm-insite04p.var.log.httpd.tgz
[root@vm-insite04p ~]#
[support@centos00 ~]$ SSHPASS="$(pass common/linux)" sshpass -e scp -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@vm-insite04p:/tmp/20170316.vm-insite04p.var.log.httpd.tgz ~/mnt/share/temp/

................................................................................
................................................................................

[root@vm-insite04p ~]# expr 1024 \* 5
5120
[root@vm-insite04p ~]# dd if=/dev/zero of=/swapfile bs=1M count=5120
5120+0 records in
5120+0 records out
5368709120 bytes (5.4 GB) copied, 10.5795 s, 507 MB/s
[root@vm-insite04p ~]# chmod 0600 /swapfile
[root@vm-insite04p ~]# mkswap /swapfile
Setting up swapspace version 1, size = 5242876 KiB
no label, UUID=40acae20-02b0-4be4-bb6b-76e1b0b8204d
[root@vm-insite04p ~]# ls -Alh /swapfile
-rw-------. 1 root root 5.0G Mar 16 18:56 /swapfile
[root@vm-insite04p ~]# swapon /swapfile
[root@vm-insite04p ~]# swapon -s
Filename                                Type            Size    Used    Priority
/swapfile                               file    5242876 0       -1
[root@vm-insite04p ~]# cat /proc/swaps
Filename                                Type            Size    Used    Priority
/swapfile                               file            5242876 0       -1
[root@vm-insite04p ~]# free -hm
              total        used        free      shared  buff/cache   available
Mem:            31G        8.8G         13G        145M        9.3G         21G
Swap:          5.0G          0B        5.0G
[root@vm-insite04p ~]#


[root@vm-insite04p ~]# vim /etc/fstab

[root@vm-insite04p ~]# tail -n 1 /etc/fstab
/swapfile          swap            swap    defaults        0 0
[root@vm-insite04p ~]#

................................................................................

[root@vm-insite04p ~]# grep -e "mmap" /var/log/messages | less
Mar 15 12:11:26 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
Mar 15 12:12:41 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
Mar 15 12:12:42 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
Mar 15 13:40:55 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
Mar 15 13:40:55 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
Mar 15 13:40:56 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
Mar 16 15:20:21 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
Mar 16 15:20:48 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
Mar 16 16:20:35 vm-insite04p kernel: [<ffffffff811b7825>] ? do_mmap_pgoff+0x305/0x3c0
[root@vm-insite04p ~]# grep -e "mmap" /var/log/httpd/error_log | less
mmap() failed: [12] Cannot allocate memory
mmap() failed: [12] Cannot allocate memory
mmap() failed: [12] Cannot allocate memory
[root@vm-insite04p ~]#

................................................................................

#
#   Next day.
#   20170317
#

#   Memory is close to run out.
#   Swap was not used yet I suppose.
#
[root@vm-insite04p ~]# free -hm
              total        used        free      shared  buff/cache   available
Mem:            31G         11G        2.7G        177M         16G         18G
Swap:          5.0G          0B        5.0G
[root@vm-insite04p ~]# ps axu | grep httpd | wc -l
1602
[root@vm-insite04p ~]#

#   There is no new records appeared since last that was yesterday.
#
[root@vm-insite04p ~]# grep -e "oom-kill" /var/log/messages | tail -n 3
Mar 16 16:00:52 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 16:20:35 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
Mar 16 16:42:37 vm-insite04p kernel: httpd invoked oom-killer: gfp_mask=0x280da, order=0, oom_score_adj=0
[root@vm-insite04p ~]#

................................................................................

#
#   20170320
#

[root@vm-insite04p ~]# LC_ALL=C sar -A -f /var/log/sa/sa18 > /tmp/sa18.txt
[root@vm-insite04p ~]# LC_ALL=C sar -A -f /var/log/sa/sa19 > /tmp/sa19.txt

[root@vm-insite04p ~]# ls -Alh /tmp/sa*
-rw-r--r--. 1 root root 388K Mar 20 11:56 /tmp/sa18.txt
-rw-r--r--. 1 root root 388K Mar 20 11:56 /tmp/sa19.txt
[root@vm-insite04p ~]#

................................................................................

#
#   20170321
#   Continue investigations. Again was happened stuck at 4 a.m.
#

[root@vm-insite04p ~]# systemctl status smb
● smb.service - Samba SMB Daemon
   Loaded: loaded (/usr/lib/systemd/system/smb.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2017-03-21 10:41:28 MSK; 11min ago
 Main PID: 16607 (smbd)
   Status: "smbd: ready to serve connections..."
   CGroup: /system.slice/smb.service
           ├─16607 /usr/sbin/smbd
           ├─16608 /usr/sbin/smbd
           ├─16609 /usr/sbin/smbd
           ├─16612 /usr/sbin/smbd
           ├─16614 /usr/sbin/smbd
           ├─16615 /usr/sbin/smbd
           ├─16616 /usr/sbin/smbd
           ├─16617 /usr/sbin/smbd
           ├─16618 /usr/sbin/smbd
           ├─16619 /usr/sbin/smbd
           ├─16620 /usr/sbin/smbd
           ├─16621 /usr/sbin/smbd
           ├─16622 /usr/sbin/smbd
           ├─16623 /usr/sbin/smbd
           ├─16624 /usr/sbin/smbd
           ├─16625 /usr/sbin/smbd
           ├─16626 /usr/sbin/smbd
           ├─16627 /usr/sbin/smbd
           ├─16628 /usr/sbin/smbd
           ├─16629 /usr/sbin/smbd
           ├─16630 /usr/sbin/smbd
           ├─16631 /usr/sbin/smbd
           ├─16632 /usr/sbin/smbd
           ├─16633 /usr/sbin/smbd
           ├─16634 /usr/sbin/smbd
           ├─16635 /usr/sbin/smbd
           ├─16636 /usr/sbin/smbd
           ├─16637 /usr/sbin/smbd
           ├─16638 /usr/sbin/smbd
           ├─16650 /usr/sbin/smbd
           ├─16657 /usr/sbin/smbd
           ├─16719 /usr/sbin/smbd
           ├─16780 /usr/sbin/smbd
           ├─16832 /usr/sbin/smbd
           ├─17128 /usr/sbin/smbd
           ├─17144 /usr/sbin/smbd
           ├─17149 /usr/sbin/smbd
           ├─17173 /usr/sbin/smbd
           ├─17177 /usr/sbin/smbd
           ├─17186 /usr/sbin/smbd
           ├─17292 /usr/sbin/smbd
           └─17558 /usr/sbin/smbd

Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:30 vm-insite04p.tcsbank.ru smbd_audit[16627]: TCSBANK\s.shalyapin|172.16.169.88|pwrite|ok|upload/test/procedure_claims_client_service.php
Mar 21 10:52:40 vm-insite04p.tcsbank.ru smbd_audit[16616]: TCSBANK\k.v.solovyev|172.16.169.36|pwrite|ok|departments/processes/dev/k.v.solovyev/custom/repr_news/commit_answer.php
[root@vm-insite04p ~]#


[root@vm-insite04p ~]# ps aux | egrep -e "sm[b]|winbin[d]" | wc -l
50
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# ps aux | egrep -e "sm[b]" | wc -l
44
[root@vm-insite04p ~]# ps aux | egrep -e "winbin[d]" | wc -l
7
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# free -mh
              total        used        free      shared  buff/cache   available
Mem:            31G         11G        4.9G        488M         14G         17G
Swap:          5.0G        380K        5.0G
[root@vm-insite04p ~]#

................................................................................

#
#   There are no new messages, related with memory exceed.
#
[root@vm-insite04p ~]# grep -B 2 -e "mmap" /var/log/httpd/error_log
[Thu Mar 16 15:19:53.209046 2017] [core:notice] [pid 15472] AH00052: child pid 21335 exit signal Segmentation fault (11)

mmap() failed: [12] Cannot allocate memory

mmap() failed: [12] Cannot allocate memory

mmap() failed: [12] Cannot allocate memory
[root@vm-insite04p ~]#

[root@vm-insite04p ~]# egrep -e "Out of memory|oom-killer" /var/log/messages
[root@vm-insite04p ~]#

................................................................................

#
#   Problem was found in MySQL database, used for this website.
#   Database worked on other server. And at 4 a.m. had stuck for ten minutes.
#   Special task was executed on that database.
#



