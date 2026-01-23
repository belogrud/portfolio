

[root@vm-postgresql02t ~]# cat /etc/system-release
Red Hat Enterprise Linux Server release 7.3 (Maipo)
[root@vm-postgresql02t ~]#


[root@vm-postgresql02t ~]# ip -f inet addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
    inet 10.217.53.94/24 brd 10.217.53.255 scope global eth0
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
    inet 10.217.68.30/24 brd 10.217.68.255 scope global eth1
       valid_lft forever preferred_lft forever
[root@vm-postgresql02t ~]#

................................................................................

[root@vm-postgresql02t ~]# swapon -s
Filename                                Type            Size    Used    Priority
/swap                                   file    1048572 0       -1
[root@vm-postgresql02t ~]# ls -Alh /swap
-rw-------. 1 root root 1.0G Mar 21 17:01 /swap
[root@vm-postgresql02t ~]# cat /proc/swaps
Filename                                Type            Size    Used    Priority
/swap                                   file            1048572 0       -1
[root@vm-postgresql02t ~]# swapoff /swap
[root@vm-postgresql02t ~]# cat /proc/swaps
Filename                                Type            Size    Used    Priority
[root@vm-postgresql02t ~]#



[root@vm-postgresql02t ~]# expr 1024 \* 8
8192
[root@vm-postgresql02t ~]# dd if=/dev/zero of=/swapfile bs=1M count=$(expr 1024 \* 8)
8192+0 records in
8192+0 records out
8589934592 bytes (8.6 GB) copied, 239.828 s, 35.8 MB/s
[root@vm-postgresql02t ~]#

[root@vm-postgresql02t ~]# chmod 0600 /swapfile
[root@vm-postgresql02t ~]# mkswap /swapfile
Setting up swapspace version 1, size = 8388604 KiB
no label, UUID=8b1b3fb9-893c-4618-901d-0594b92700e7
[root@vm-postgresql02t ~]#

[root@vm-postgresql02t ~]# swapon -a -v
swapon /swapfile
swapon: /swapfile: found swap signature: version 1, page-size 4, same byte order
swapon: /swapfile: pagesize=4096, swapsize=8589934592, devsize=8589934592
[root@vm-postgresql02t ~]# swapon -s
Filename                                Type            Size    Used    Priority
/swapfile                               file    8388604 0       -1
[root@vm-postgresql02t ~]#

................................................................................

#
#   20170418
#

[root@vm-postgresql02t ~]# mount -v /data/apitravel
mount.nfs: trying text-based options 'bg,hard,rsize=65536,wsize=65536,nfsvers=3,actimeo=0,nointr,timeo=600,tcp,addr=10.217.68.6'
mount.nfs: prog 100003, trying vers=3, prot=6
mount.nfs: trying 10.217.68.6 prog 100003 vers 3 prot TCP port 2049
mount.nfs: prog 100005, trying vers=3, prot=6
mount.nfs: trying 10.217.68.6 prog 100005 vers 3 prot TCP port 4046
[root@vm-postgresql02t ~]# df -hT
Filesystem                              Type      Size  Used Avail Use% Mounted on
/dev/mapper/vg_root-lvol0               xfs        20G  9.5G   11G  49% /
devtmpfs                                devtmpfs  7.8G     0  7.8G   0% /dev
tmpfs                                   tmpfs     7.8G     0  7.8G   0% /dev/shm
tmpfs                                   tmpfs     7.8G   17M  7.8G   1% /run
tmpfs                                   tmpfs     7.8G     0  7.8G   0% /sys/fs/cgroup
/dev/sda1                               xfs       253M  119M  135M  47% /boot
fas6280b-m1-nfs:/vol/callquality_pre_m1 nfs       100G   13M  100G   1% /data/callquality
tmpfs                                   tmpfs     1.6G     0  1.6G   0% /run/user/525
fas6280b-m1-nfs:/vol/apitravel_tst_m1   nfs       100G   14M  100G   1% /data/apitravel
[root@vm-postgresql02t ~]#

[root@vm-postgresql02t ~]# groupadd -g 1000 oinstall
[root@vm-postgresql02t ~]# groupadd -g 1001 dba
[root@vm-postgresql02t ~]# groupadd -g 506 vsn && useradd -u 506 -g vsn -c "SD#331533. Varakuta Sergey" -m -G oinstall,dba -s /bin/bash -p '$6$ZLzY2rfs$mEYA0it/.8Ur2mTp06esSJVNvSvJ8kMbqkTTehmYa8dtitNYQ7U1dF7IXaOSNcP7ksg6vJYRhJIQj.2FgklZE0' vsn
[root@vm-postgresql02t ~]# id !$
id vsn
uid=506(vsn) gid=506(vsn) groups=506(vsn),1000(oinstall),1001(dba)
[root@vm-postgresql02t ~]# groupadd -g 505 nms && useradd -u 505 -g nms -c "SD#331533. Novikov Matvey" -m -G oinstall,dba -s /bin/bash -p '$1$/Tp0S830$dCWet0RdPGUk0Sj216ytl.' nms                          [root@vm-postgresql02t ~]# id nms
uid=505(nms) gid=505(nms) groups=505(nms),1000(oinstall),1001(dba)
[root@vm-postgresql02t ~]# useradd -u 1000 -g dba -c "SD#331533. Oracle user" -m -G oinstall -d /opt/oracle -s /bin/bash -p '$1$zY2HEJt9$qof352TAMpICa0VRTqXPg/' oracle
[root@vm-postgresql02t ~]# id vsn ; id nms ; id oracle ;
uid=506(vsn) gid=506(vsn) groups=506(vsn),1000(oinstall),1001(dba)
uid=505(nms) gid=505(nms) groups=505(nms),1000(oinstall),1001(dba)
uid=1000(oracle) gid=1001(dba) groups=1001(dba),1000(oinstall)
[root@vm-postgresql02t ~]#


[root@m1-db-tst ~]# grep gss /etc/{passwd,shadow}
/etc/passwd:gss:x:753:753:Golovkin Sergey Sergeevich:/home/gss:/bin/bash
/etc/shadow:gss:$1$mz5SO28t$HhdZLZA0/a/gp1jmNsCWK0:17184:1:90:7:::
[root@m1-db-tst ~]#

[root@vm-postgresql02t ~]# groupadd -g 753 gss && useradd -u 753 -g gss -c "SD#331533. Golovkin Sergey Sergeevich" -m -G oinstall,dba -s /bin/bash -p '$1$mz5SO28t$HhdZLZA0/a/gp1jmNsCWK0' gss

................................................................................

[root@vm-postgresql02t ~]# cat > /etc/yum.repos.d/pgdg-95-redhat.repo
[pgdg95]
name=PostgreSQL 9.5 $releasever - $basearch
baseurl=http://repo-linux/postgresql/yum/9.5/redhat/rhel-$releasever-$basearch
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-PGDG-95
[root@vm-postgresql02t ~]#

................................................................................




