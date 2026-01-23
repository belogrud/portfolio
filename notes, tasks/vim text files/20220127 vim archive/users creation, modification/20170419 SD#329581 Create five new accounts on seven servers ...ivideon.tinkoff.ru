


ext.abityutskiy    Битюцкий Антон Леонидович
ext.vpanchenko Панченко Виталий Валерьевич
ext.vsemenova Семенов Вадим Николаевич
ext.vpinchuk  Пинчук Вадим Сталевич
ext.szadneev Заднеев Сергей Валерьевич


central01-01.ivideon.tinkoff.ru
10.219.30.1/24
1й IP 1го центрального сервера
central02-01.ivideon.tinkoff.ru
10.219.31.1/24
1й IP 2го центрального сервера
central01-02.ivideon.tinkoff.ru
10.219.30.2/24
2й IP 1го центрального сервера
central02-02.ivideon.tinkoff.ru
10.219.31.2/24
2й IP 2го центрального сервера
streamingl01.Ivideon.tinkoff.ru
10.219.30.3/24

streamingl02.ivideon.tinkoff.ru
10.219.31.3/24

Backup01.ivideon.tinkoff.ru
10.219.32.1/24



central01-01.ivideon.tinkoff.ru
central02-01.ivideon.tinkoff.ru
central01-02.ivideon.tinkoff.ru
central02-02.ivideon.tinkoff.ru
streamingl01.Ivideon.tinkoff.ru
streamingl02.ivideon.tinkoff.ru
backup01.ivideon.tinkoff.ru


10.219.30.1/24

................................................................................

[root@centos00 20170322-1726]# pwgen -c -n -s -C 10 1
6bAYdiUIyy
[root@centos00 20170322-1726]#
[root@centos00 20170322-1726]# grub-crypt
Password:
Retype password:
$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.
[root@centos00 20170322-1726]#


................................................................................


[support@centos00 ~]$ export SSHPASS="$(pass common/linux)" ; for var1_index in central01-01.ivideon.tinkoff.ru central02-01.ivideon.tinkoff.ru central01-02.ivideon.tinkoff.ru central02-02.ivideon.tinkoff.ru streamingl01.Ivideon.tinkoff.ru streamingl02.ivideon.tinkoff.ru backup01.ivideon.tinkoff.ru ; do sshpass -e ssh -t -oStrictHostKeyChecking=no bsv@${var1_index} "( echo '$(pass common/linux)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4091 ext.abityutskiy ; useradd -u 4091 -g ext.abityutskiy -c \"SD#329581. Bityutskiy Anton Leonidovich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.abityutskiy ; id ext.abityutskiy ; grep ext.abityutskiy /etc/passwd /etc/shadow ; chage -d 0 ext.abityutskiy ; chage -l ext.abityutskiy ; ' )" ; done
Warning: Permanently added 'central01-01.ivideon.tinkoff.ru,10.219.30.1' (RSA) to the list of known hosts.
[sudo] password for bsv: bsv is not in the sudoers file.  This incident will be reported.
Connection to central01-01.ivideon.tinkoff.ru closed.
[sudo] password for bsv: bsv is not in the sudoers file.  This incident will be reported.
Connection to central02-01.ivideon.tinkoff.ru closed.
Warning: Permanently added 'central01-02.ivideon.tinkoff.ru,10.219.30.2' (RSA) to the list of known hosts.
[sudo] password for bsv: bsv is not in the sudoers file.  This incident will be reported.
Connection to central01-02.ivideon.tinkoff.ru closed.
Warning: Permanently added 'central02-02.ivideon.tinkoff.ru,10.219.31.2' (RSA) to the list of known hosts.
[sudo] password for bsv: bsv is not in the sudoers file.  This incident will be reported.
Connection to central02-02.ivideon.tinkoff.ru closed.
ssh: connect to host streamingl01.Ivideon.tinkoff.ru port 22: Connection timed out
^C
[support@centos00 ~]$


[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in central01-01.ivideon.tinkoff.ru central02-01.ivideon.tinkoff.ru central01-02.ivideon.tinkoff.ru central02-02.ivideon.tinkoff.ru streamingl01.Ivideon.tinkoff.ru streamingl02.ivideon.tinkoff.ru backup01.ivideon.tinkoff.ru ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4091 ext.abityutskiy ; useradd -u 4091 -g ext.abityutskiy -c \"SD#329581. Bityutskiy Anton Leonidovich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.abityutskiy ; id ext.abityutskiy ; grep ext.abityutskiy /etc/passwd /etc/shadow ; chage -d 0 ext.abityutskiy ; chage -l ext.abityutskiy ; ' )" ; done

ds-atm-ivideon-central01.tcsbank.ru
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy)
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/shadow:ext.abityutskiy:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-01.ivideon.tinkoff.ru closed.

m1-atm-ivideon-central01.tcsbank.ru
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy)
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/shadow:ext.abityutskiy:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-01.ivideon.tinkoff.ru closed.

ds-atm-ivideon-streaming01.tcsbank.ru
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy)
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/shadow:ext.abityutskiy:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-02.ivideon.tinkoff.ru closed.

m1-atm-ivideon-streaming01.tcsbank.ru
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy)
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/shadow:ext.abityutskiy:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-02.ivideon.tinkoff.ru closed.
ssh: connect to host streamingl01.Ivideon.tinkoff.ru port 22: Connection timed out
ssh: connect to host streamingl02.ivideon.tinkoff.ru port 22: Connection timed out
Warning: Permanently added 'backup01.ivideon.tinkoff.ru' (RSA) to the list of known hosts.
Permission denied, please try again.
[support@centos00 ~]$

................................................................................
................................................................................


[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in central01-01.ivideon.tinkoff.ru central02-01.ivideon.tinkoff.ru central01-02.ivideon.tinkoff.ru central02-02.ivideon.tinkoff.ru ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4092 ext.vpanchenko ; useradd -u 4092 -g ext.vpanchenko -c \"SD#329581. Panchenko Vitaliy Valeryevich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.vpanchenko ; id ext.vpanchenko ; grep ext.vpanchenko /etc/passwd /etc/shadow ; chage -d 0 ext.vpanchenko ; chage -l ext.vpanchenko ; ' )" ; done
ds-atm-ivideon-central01.tcsbank.ru
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko)
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/shadow:ext.vpanchenko:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-01.ivideon.tinkoff.ru closed.

m1-atm-ivideon-central01.tcsbank.ru
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko)
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/shadow:ext.vpanchenko:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-01.ivideon.tinkoff.ru closed.

ds-atm-ivideon-streaming01.tcsbank.ru
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko)
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/shadow:ext.vpanchenko:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-02.ivideon.tinkoff.ru closed.

m1-atm-ivideon-streaming01.tcsbank.ru
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko)
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/shadow:ext.vpanchenko:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-02.ivideon.tinkoff.ru closed.
[support@centos00 ~]$

................................................................................
................................................................................

[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in central01-01.ivideon.tinkoff.ru central02-01.ivideon.tinkoff.ru central01-02.ivideon.tinkoff.ru central02-02.ivideon.tinkoff.ru ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4093 ext.vsemenova ; useradd -u 4093 -g ext.vsemenova -c \"SD#329581. Semenova Vadima Nikolaevicha\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.vsemenova ; id ext.vsemenova ; grep ext.vsemenova /etc/passwd /etc/shadow ; chage -d 0 ext.vsemenova ; chage -l ext.vsemenova ; ' )" ; done

ds-atm-ivideon-central01.tcsbank.ru
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova)
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/shadow:ext.vsemenova:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-01.ivideon.tinkoff.ru closed.

m1-atm-ivideon-central01.tcsbank.ru
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova)
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/shadow:ext.vsemenova:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-01.ivideon.tinkoff.ru closed.

ds-atm-ivideon-streaming01.tcsbank.ru
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova)
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/shadow:ext.vsemenova:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-02.ivideon.tinkoff.ru closed.

m1-atm-ivideon-streaming01.tcsbank.ru
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova)
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/shadow:ext.vsemenova:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-02.ivideon.tinkoff.ru closed.
[support@centos00 ~]$

................................................................................
................................................................................

[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in central01-01.ivideon.tinkoff.ru central02-01.ivideon.tinkoff.ru central01-02.ivideon.tinkoff.ru central02-02.ivideon.tinkoff.ru ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4094 ext.vpinchuk ; useradd -u 4094 -g ext.vpinchuk -c \"SD#329581. Pinchuk Vadim Stalevich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.vpinchuk ; id ext.vpinchuk ; grep ext.vpinchuk /etc/passwd /etc/shadow ; chage -d 0 ext.vpinchuk ; chage -l ext.vpinchuk ; ' )" ; done

ds-atm-ivideon-central01.tcsbank.ru
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk)
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/shadow:ext.vpinchuk:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-01.ivideon.tinkoff.ru closed.

m1-atm-ivideon-central01.tcsbank.ru
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk)
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/shadow:ext.vpinchuk:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-01.ivideon.tinkoff.ru closed.

ds-atm-ivideon-streaming01.tcsbank.ru
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk)
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/shadow:ext.vpinchuk:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-02.ivideon.tinkoff.ru closed.

m1-atm-ivideon-streaming01.tcsbank.ru
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk)
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/shadow:ext.vpinchuk:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-02.ivideon.tinkoff.ru closed.
[support@centos00 ~]$

................................................................................
................................................................................


[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in central01-01.ivideon.tinkoff.ru central02-01.ivideon.tinkoff.ru central01-02.ivideon.tinkoff.ru central02-02.ivideon.tinkoff.ru ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4095 ext.szadneev ; useradd -u 4095 -g ext.szadneev -c \"SD#329581. Zadneev Sergey Valeryevich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.szadneev ; id ext.szadneev ; grep ext.szadneev /etc/passwd /etc/shadow ; chage -d 0 ext.szadneev ; chage -l ext.szadneev ; ' )" ; done

ds-atm-ivideon-central01.tcsbank.ru
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev)
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.szadneev:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-01.ivideon.tinkoff.ru closed.

m1-atm-ivideon-central01.tcsbank.ru
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev)
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.szadneev:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-01.ivideon.tinkoff.ru closed.

ds-atm-ivideon-streaming01.tcsbank.ru
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev)
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.szadneev:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central01-02.ivideon.tinkoff.ru closed.

m1-atm-ivideon-streaming01.tcsbank.ru
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev)
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.szadneev:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17275:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to central02-02.ivideon.tinkoff.ru closed.
[support@centos00 ~]$


................................................................................
................................................................................

From: Belogrud Sergey Vladimirovich
Sent: Wednesday, April 19, 2017 7:13 PM
To: Shmorgilov Fedor Konstantinovich
Subject: Дополнительная информация по SD#329581

Добрый день.

Дополнительная информация по SD#329581
Созданы учётные записи:
ext.abityutskiy
ext.vpanchenko
ext.vsemenova
ext.vpinchuk
ext.szadneev

На серверах:
central01-01.ivideon.tinkoff.ru
central02-01.ivideon.tinkoff.ru
central01-02.ivideon.tinkoff.ru
central02-02.ivideon.tinkoff.ru

Пароль для всех учётных записей одинаков. При первом логине его потребуется сменить на свой.
Password: 6bAYdiUIyy


Доступ к перечисленным трём серверам отсутствует:
streamingl01.Ivideon.tinkoff.ru
streamingl02.ivideon.tinkoff.ru
backup01.ivideon.tinkoff.ru

ssh: connect to host streamingl01.Ivideon.tinkoff.ru port 22: Connection timed out
ssh: connect to host streamingl02.ivideon.tinkoff.ru port 22: Connection timed out
Warning: Permanently added 'backup01.ivideon.tinkoff.ru' (RSA) to the list of known hosts.
Permission denied, please try again.


С уважением,

Сергей Белогруд
Старший системный администратор

................................................................................
................................................................................
................................................................................

#
#   20170420
#

[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4091 ext.abityutskiy ; useradd -u 4091 -g ext.abityutskiy -c \"SD#329581. Bityutskiy Anton Leonidovich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.abityutskiy ; id ext.abityutskiy ; grep ext.abityutskiy /etc/passwd /etc/shadow ; chage -d 0 ext.abityutskiy ; chage -l ext.abityutskiy ; ' )" ; done

vm-atm-ivideon-backup01.tcsbank.ru
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy)
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/shadow:ext.abityutskiy:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to 10.219.32.1 closed.
[support@centos00 ~]$


[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4092 ext.vpanchenko ;useradd -u 4092 -g ext.vpanchenko -c \"SD#329581. Panchenko Vitaliy Valeryevich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.vpanchenko ; id ext.vpanchenko ; grep ext.vpanchenko /etc/passwd /etc/shadow ; chage -d 0 ext.vpanchenko ; chage -l ext.vpanchenko ; ' )" ; done

vm-atm-ivideon-backup01.tcsbank.ru
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko)
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/shadow:ext.vpanchenko:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to 10.219.32.1 closed.
[support@centos00 ~]$


[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4093 ext.vsemenova ; useradd -u 4093 -g ext.vsemenova -c \"SD#329581. Semenova Vadima Nikolaevicha\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.vsemenova ; id ext.vsemenova ; grep ext.vsemenova /etc/passwd /etc/shadow ; chage -d 0 ext.vsemenova ; chage -l ext.vsemenova ; ' )" ; done

vm-atm-ivideon-backup01.tcsbank.ru
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova)
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/shadow:ext.vsemenova:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to 10.219.32.1 closed.
[support@centos00 ~]$


[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4094 ext.vpinchuk ; useradd -u 4094 -g ext.vpinchuk -c \"SD#329581. Pinchuk Vadim Stalevich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.vpinchuk ; id ext.vpinchuk ; grep ext.vpinchuk /etc/passwd /etc/shadow ; chage -d 0 ext.vpinchuk ; chage -l ext.vpinchuk ; ' )" ; done

vm-atm-ivideon-backup01.tcsbank.ru
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk)
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/shadow:ext.vpinchuk:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to 10.219.32.1 closed.
[support@centos00 ~]$

[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux-default)' | sudo -S -i sh -c ' echo ; hostname ; groupadd -g 4095 ext.szadneev ; useradd -u 4095 -g ext.szadneev -c \"SD#329581. Zadneev Sergey Valeryevich\" -m -s /bin/bash -p ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ext.szadneev ; id ext.szadneev ; grep ext.szadneev /etc/passwd /etc/shadow ; chage -d 0 ext.szadneev ; chage -l ext.szadneev ; ' )" ; done
Warning: Permanently added '10.219.32.1' (RSA) to the list of known hosts.

vm-atm-ivideon-backup01.tcsbank.ru
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev)
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.szadneev:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
Last password change                                    : password must be changed
Password expires                                        : password must be changed
Password inactive                                       : password must be changed
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
Connection to 10.219.32.1 closed.
[support@centos00 ~]$

................................................................................
................................................................................

#
#   20170421
#

[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -D -i sh -c ' echo ; hostname ; echo ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ; ' )" ; done

vm-atm-ivideon-backup01.tcsbank.ru
$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.
Connection to 10.219.32.1 closed.
[support@centos00 ~]$
[support@centos00 ~]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -i sh -c ' echo ; hostname ; echo ''\\\$6\\\$kqIbDuDPYesJdjKi\\\$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.'' ; ' )" ; done

vm-atm-ivideon-backup01.tcsbank.ru
\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.
Connection to 10.219.32.1 closed.
[support@centos00 ~]$

................................................................................

[support@centos00 20170421-1128]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.30.1 10.219.30.2 10.219.30.3 10.219.31.1 10.219.31.2 10.219.31.3 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -D -i sh -c ' echo ; hostname ; egrep -e ''ext.abityutskiy\|ext.vpanchenko\|ext.vsemenova\|ext.vpinchuk\|ext.szadneev '' /etc/passwd /etc/shadow ; ' )" ; done

ds-atm-ivideon-central01.tcsbank.ru
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.abityutskiy:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpanchenko:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vsemenova:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpinchuk:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.szadneev:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
Connection to 10.219.30.1 closed.

ds-atm-ivideon-central01.tcsbank.ru
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.abityutskiy:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpanchenko:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vsemenova:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpinchuk:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.szadneev:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
Connection to 10.219.30.2 closed.

ds-atm-ivideon-streaming01.tcsbank.ru
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.abityutskiy:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpanchenko:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vsemenova:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpinchuk:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.szadneev:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
Connection to 10.219.30.3 closed.

m1-atm-ivideon-central01.tcsbank.ru
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.abityutskiy:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpanchenko:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vsemenova:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpinchuk:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.szadneev:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
Connection to 10.219.31.1 closed.

m1-atm-ivideon-central01.tcsbank.ru
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.abityutskiy:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpanchenko:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vsemenova:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpinchuk:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.szadneev:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
Connection to 10.219.31.2 closed.

m1-atm-ivideon-streaming01.tcsbank.ru
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/shadow:ext.abityutskiy:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpanchenko:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vsemenova:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.vpinchuk:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
/etc/shadow:ext.szadneev:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17277:0:99999:7:::
Connection to 10.219.31.3 closed.

vm-atm-ivideon-backup01.tcsbank.ru
/etc/passwd:ext.szadneev:x:4095:4095:SD#329581. Zadneev Sergey Valeryevich:/home/ext.szadneev:/bin/bash
/etc/passwd:ext.vpinchuk:x:4094:4094:SD#329581. Pinchuk Vadim Stalevich:/home/ext.vpinchuk:/bin/bash
/etc/passwd:ext.vsemenova:x:4093:4093:SD#329581. Semenova Vadima Nikolaevicha:/home/ext.vsemenova:/bin/bash
/etc/passwd:ext.vpanchenko:x:4092:4092:SD#329581. Panchenko Vitaliy Valeryevich:/home/ext.vpanchenko:/bin/bash
/etc/passwd:ext.abityutskiy:x:4091:4091:SD#329581. Bityutskiy Anton Leonidovich:/home/ext.abityutskiy:/bin/bash
/etc/shadow:ext.szadneev:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
/etc/shadow:ext.vpinchuk:\.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:0:0:99999:7:::
/etc/shadow:ext.vsemenova:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
/etc/shadow:ext.vpanchenko:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
/etc/shadow:ext.abityutskiy:$6$kqIbDuDPYesJdjKi$ttWf0JWGqOkK3k.w/HN69dBdY9HBN1NGBSluHeKa6B212Jt7V7g78QGIPSaarYrAU/c3VhLAdfs5cS7aKgWVy.:17276:0:99999:7:::
Connection to 10.219.32.1 closed.
[support@centos00 20170421-1128]$

................................................................................

root@ds-atm-ivideon-central01:~# grep "^%admin" /etc/sudoers
%admin ALL=(ALL) ALL
root@ds-atm-ivideon-central01:~# echo -e "\n%wheel ALL=(ALL) ALL" >> /etc/sudoers
root@ds-atm-ivideon-central01:~# tail !$
tail /etc/sudoers
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d

%wheel ALL=(ALL) ALL
root@ds-atm-ivideon-central01:~#


root@ds-atm-ivideon-central01:~# getent group wheel && echo "exist"
wheel:x:1000:a.leonov,avk,che,bsv,ash,tan,qom,sebor
exist
root@ds-atm-ivideon-central01:~# getent group wheelll && echo "exist"
root@ds-atm-ivideon-central01:~#



[support@centos00 20170421-1128]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.30.3 10.219.31.1 10.219.31.2 10.219.31.3 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -D -i sh -c ' echo ; hostname ; getent group wheel && echo "%wheel ALL=\\\(ALL\\\) ALL" >> /etc/sudoers ; tail -n 2 /etc/sudoers; ' )" ; done
[support@centos00 20170421-1128]$


[support@centos00 20170421-1128]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.30.3 10.219.31.1 10.219.31.3 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -D -i sh -c ' echo ; hostname ; tail -n 2 /etc/sudoers ; ' )" ; done

ds-atm-ivideon-streaming01.tcsbank.ru

%wheel ALL=(ALL) ALL
Connection to 10.219.30.3 closed.

m1-atm-ivideon-central01.tcsbank.ru

%wheel ALL=(ALL) ALL
Connection to 10.219.31.1 closed.

m1-atm-ivideon-streaming01.tcsbank.ru

%wheel ALL=(ALL) ALL
Connection to 10.219.31.3 closed.

vm-atm-ivideon-backup01.tcsbank.ru

%wheel ALL=(ALL) ALL
Connection to 10.219.32.1 closed.
[support@centos00 20170421-1128]$

................................................................................
................................................................................

[support@centos00 20170421-1128]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.30.1 10.219.30.3 10.219.31.1 10.219.31.3 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -D -i sh -c ' echo ; hostname ; gpasswd -a ext.abityutskiy wheel ; gpasswd -a ext.vpanchenko wheel ; gpasswd -a ext.vsemenova wheel ; gpasswd -a ext.vpinchuk wheel ; gpasswd -a ext.szadneev wheel ; id ext.abityutskiy ; id ext.vpanchenko ; id ext.vsemenova ; id ext.vpinchuk ; id ext.szadneev ; ' )" ; done

ds-atm-ivideon-central01.tcsbank.ru
Adding user ext.abityutskiy to group wheel
Adding user ext.vpanchenko to group wheel
Adding user ext.vsemenova to group wheel
Adding user ext.vpinchuk to group wheel
Adding user ext.szadneev to group wheel
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy),1000(wheel)
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko),1000(wheel)
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova),1000(wheel)
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk),1000(wheel)
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev),1000(wheel)
Connection to 10.219.30.1 closed.

ds-atm-ivideon-streaming01.tcsbank.ru
Adding user ext.abityutskiy to group wheel
Adding user ext.vpanchenko to group wheel
Adding user ext.vsemenova to group wheel
Adding user ext.vpinchuk to group wheel
Adding user ext.szadneev to group wheel
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy),1000(wheel)
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko),1000(wheel)
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova),1000(wheel)
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk),1000(wheel)
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev),1000(wheel)
Connection to 10.219.30.3 closed.

m1-atm-ivideon-central01.tcsbank.ru
Adding user ext.abityutskiy to group wheel
Adding user ext.vpanchenko to group wheel
Adding user ext.vsemenova to group wheel
Adding user ext.vpinchuk to group wheel
Adding user ext.szadneev to group wheel
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy),1000(wheel)
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko),1000(wheel)
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova),1000(wheel)
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk),1000(wheel)
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev),1000(wheel)
Connection to 10.219.31.1 closed.

m1-atm-ivideon-streaming01.tcsbank.ru
Adding user ext.abityutskiy to group wheel
Adding user ext.vpanchenko to group wheel
Adding user ext.vsemenova to group wheel
Adding user ext.vpinchuk to group wheel
Adding user ext.szadneev to group wheel
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy),1000(wheel)
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko),1000(wheel)
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova),1000(wheel)
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk),1000(wheel)
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev),1000(wheel)
Connection to 10.219.31.3 closed.

vm-atm-ivideon-backup01.tcsbank.ru
Adding user ext.abityutskiy to group wheel
Adding user ext.vpanchenko to group wheel
Adding user ext.vsemenova to group wheel
Adding user ext.vpinchuk to group wheel
Adding user ext.szadneev to group wheel
uid=4091(ext.abityutskiy) gid=4091(ext.abityutskiy) groups=4091(ext.abityutskiy),1000(wheel)
uid=4092(ext.vpanchenko) gid=4092(ext.vpanchenko) groups=4092(ext.vpanchenko),1000(wheel)
uid=4093(ext.vsemenova) gid=4093(ext.vsemenova) groups=4093(ext.vsemenova),1000(wheel)
uid=4094(ext.vpinchuk) gid=4094(ext.vpinchuk) groups=4094(ext.vpinchuk),1000(wheel)
uid=4095(ext.szadneev) gid=4095(ext.szadneev) groups=4095(ext.szadneev),1000(wheel)
Connection to 10.219.32.1 closed.
[support@centos00 20170421-1128]$

................................................................................
................................................................................

[support@centos00 20170421-1128]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.30.1 10.219.30.3 10.219.31.1 10.219.31.3 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -D -i sh -c ' echo ; hostname ; sudo -l -U ext.abityutskiy ; sudo -l -U ext.vpanchenko ; sudo -l -U ext.vsemenova ; sudo -l -U ext.vpinchuk ; sudo -l -U ext.szadneev ; ' )" ; done

ds-atm-ivideon-central01.tcsbank.ru
Matching Defaults entries for ext.abityutskiy on ds-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.abityutskiy may run the following commands on ds-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpanchenko on ds-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpanchenko may run the following commands on ds-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vsemenova on ds-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vsemenova may run the following commands on ds-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpinchuk on ds-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpinchuk may run the following commands on ds-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.szadneev on ds-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.szadneev may run the following commands on ds-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Connection to 10.219.30.1 closed.

ds-atm-ivideon-streaming01.tcsbank.ru
Matching Defaults entries for ext.abityutskiy on ds-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.abityutskiy may run the following commands on ds-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpanchenko on ds-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpanchenko may run the following commands on ds-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vsemenova on ds-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vsemenova may run the following commands on ds-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpinchuk on ds-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpinchuk may run the following commands on ds-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.szadneev on ds-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.szadneev may run the following commands on ds-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Connection to 10.219.30.3 closed.

m1-atm-ivideon-central01.tcsbank.ru
Matching Defaults entries for ext.abityutskiy on m1-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.abityutskiy may run the following commands on m1-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpanchenko on m1-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpanchenko may run the following commands on m1-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vsemenova on m1-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vsemenova may run the following commands on m1-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpinchuk on m1-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpinchuk may run the following commands on m1-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.szadneev on m1-atm-ivideon-central01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.szadneev may run the following commands on m1-atm-ivideon-central01.tcsbank.ru:
    (ALL) ALL
Connection to 10.219.31.1 closed.

m1-atm-ivideon-streaming01.tcsbank.ru
Matching Defaults entries for ext.abityutskiy on m1-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.abityutskiy may run the following commands on m1-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpanchenko on m1-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpanchenko may run the following commands on m1-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vsemenova on m1-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vsemenova may run the following commands on m1-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpinchuk on m1-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpinchuk may run the following commands on m1-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.szadneev on m1-atm-ivideon-streaming01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.szadneev may run the following commands on m1-atm-ivideon-streaming01.tcsbank.ru:
    (ALL) ALL
Connection to 10.219.31.3 closed.

vm-atm-ivideon-backup01.tcsbank.ru
Matching Defaults entries for ext.abityutskiy on vm-atm-ivideon-backup01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.abityutskiy may run the following commands on vm-atm-ivideon-backup01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpanchenko on vm-atm-ivideon-backup01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpanchenko may run the following commands on vm-atm-ivideon-backup01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vsemenova on vm-atm-ivideon-backup01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vsemenova may run the following commands on vm-atm-ivideon-backup01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.vpinchuk on vm-atm-ivideon-backup01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.vpinchuk may run the following commands on vm-atm-ivideon-backup01.tcsbank.ru:
    (ALL) ALL
Matching Defaults entries for ext.szadneev on vm-atm-ivideon-backup01.tcsbank.ru:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User ext.szadneev may run the following commands on vm-atm-ivideon-backup01.tcsbank.ru:
    (ALL) ALL
Connection to 10.219.32.1 closed.
[support@centos00 20170421-1128]$

................................................................................
................................................................................

[support@centos00 20170421-1128]$ export SSHPASS="$(pass common/linux-default)" ; for var1_index in 10.219.30.1 10.219.30.3 10.219.31.1 10.219.31.3 10.219.32.1 ; do sshpass -e ssh -t -oStrictHostKeyChecking=no root@${var1_index} "( echo '$(pass common/linux)' | sudo -S -D -i sh -c ' echo ; hostname ; gpasswd -a bsv wheel ; id bsv ; ' )" ; done

................................................................................
................................................................................



