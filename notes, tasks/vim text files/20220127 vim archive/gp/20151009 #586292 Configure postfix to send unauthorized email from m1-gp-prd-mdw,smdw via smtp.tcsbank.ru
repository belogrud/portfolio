

Параметры запроса
[редактировать критичность]
Номер   586292
Название    №586292
Приоритет   Средний
Класс обслуживания  9x5
Дата и время обращения  09.10.2015 12:44
Дата регистрации    09.10.2015 12:44
Тип запроса Запрос на обслуживание
Категория
Критичность 1 - Низкая
Срочность   Низкая
Описание запроса
Задачу на unix-admins.
Просьба настроить отправку почты с мастеров (mdw, smdw) продуктового ГП в М1:
echo sdjkfhsjkd |mailx -s subj d.s.pavlov@tinkoff.ru

................................................................................

[root@m1-gp-prd-smdw ~]# grep -e "^myhostname" -e "^mydomain" -e "^myorigin" -e "^inet_protocols" -e "^relayhost" /etc/postfix/main.cf
myhostname = m1-gp-prd-smdw.tcsbank.ru
mydomain = tcsbank.ru
myorigin = $myhostname
inet_protocols = ipv4
relayhost = [smtp.tcsbank.ru]
[root@m1-gp-prd-smdw ~]#

[root@m1-gp-prd-smdw ~]# mailq
Mail queue is empty
[root@m1-gp-prd-smdw ~]# tail /var/log/maillog
Oct  9 15:20:05 smdw postfix/master[22156]: daemon started -- version 2.6.6, configuration /etc/postfix
Oct  9 15:24:47 smdw postfix/postfix-script[15521]: stopping the Postfix mail system
Oct  9 15:24:47 smdw postfix/master[22156]: terminating on signal 15
Oct  9 15:27:01 smdw postfix/postfix-script[27164]: starting the Postfix mail system
Oct  9 15:27:01 smdw postfix/master[27197]: daemon started -- version 2.6.6, configuration /etc/postfix
Oct  9 15:29:22 smdw postfix/pickup[27234]: DA3D180590: uid=0 from=<root>
Oct  9 15:29:22 smdw postfix/cleanup[7826]: DA3D180590: message-id=<20151009122922.DA3D180590@m1-gp-prd-smdw.tcsbank.ru>
Oct  9 15:29:22 smdw postfix/qmgr[27235]: DA3D180590: from=<root@m1-gp-prd-smdw.tcsbank.ru>, size=551, nrcpt=1 (queue active)
Oct  9 15:29:23 smdw postfix/smtp[7830]: DA3D180590: to=<s.belogrud@tcsbank.ru>, relay=smtp.tcsbank.ru[10.219.0.2]:25, delay=0.34, delays=0.05/0.02/0.01/0.26, dsn=2.6.0, status=sent (250 2.6.0 <20151009122922.DA3D180590@m1-gp-prd-smdw.tcsbank.ru> [InternalId=42258260] Queued mail for delivery)
Oct  9 15:29:23 smdw postfix/qmgr[27235]: DA3D180590: removed
[root@m1-gp-prd-smdw ~]#


................................................................................

[root@m1-gp-prd-mdw ~]# grep -e "^myhostname" -e "^mydomain" -e "^myorigin" -e "^inet_protocols" -e "^relayhost" /etc/postfix/main.cf
myhostname = m1-gp-prd-mdw.tcsbank.ru
mydomain = tcsbank.ru
myorigin = $myhostname
inet_protocols = ipv4
relayhost = [smtp.tcsbank.ru]
[root@m1-gp-prd-mdw ~]#

[root@m1-gp-prd-mdw ~]# echo "This is testing email from host `hostname` on `date`" | mailx -s "`date +%Y%m%d-%H%M` Test mail" s.belogrud@tcsbank.ru
[root@m1-gp-prd-mdw ~]# maiq
-bash: maiq: command not found
[root@m1-gp-prd-mdw ~]# tail -f /var/log/maillog
Oct  9 15:16:03 mdw postfix/smtp[25805]: E82104401FF: to=<gpadmin@m1-gp-prd-mdw.localdomain>, relay=smtp.tcsbank.ru[10.219.0.2]:25, delay=10, delays=0/0/5/5, dsn=5.7.1, status=bounced (host smtp.tcsbank.ru[10.219.0.2] said: 530 5.7.1 Client was not authenticated (in reply to MAIL FROM command))
Oct  9 15:16:03 mdw postfix/qmgr[30870]: E82104401FF: removed
Oct  9 15:19:18 mdw postfix/scache[25810]: statistics: start interval Oct  9 15:15:38
Oct  9 15:19:18 mdw postfix/scache[25810]: statistics: domain lookup hits=0 miss=11 success=0%
Oct  9 15:19:18 mdw postfix/scache[25810]: statistics: address lookup hits=0 miss=11 success=0%
Oct  9 15:29:41 mdw postfix/pickup[30869]: B5CC5440573: uid=0 from=<root>
Oct  9 15:29:41 mdw postfix/cleanup[25699]: B5CC5440573: message-id=<20151009122941.B5CC5440573@m1-gp-prd-mdw.tcsbank.ru>
Oct  9 15:29:41 mdw postfix/qmgr[30870]: B5CC5440573: from=<root@m1-gp-prd-mdw.tcsbank.ru>, size=549, nrcpt=1 (queue active)
Oct  9 15:29:42 mdw postfix/smtp[25718]: B5CC5440573: to=<s.belogrud@tcsbank.ru>, relay=smtp.tcsbank.ru[10.219.0.2]:25, delay=0.49, delays=0.05/0.02/0.01/0.41, dsn=2.6.0, status=sent (250 2.6.0 <20151009122941.B5CC5440573@m1-gp-prd-mdw.tcsbank.ru> [InternalId=43897599] Queued mail for delivery)
Oct  9 15:29:42 mdw postfix/qmgr[30870]: B5CC5440573: removed
^C
[root@m1-gp-prd-mdw ~]#

................................................................................

#   Refresh mail queue.
postqueue -f



