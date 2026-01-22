

................................................................................

[root@ds-cassandra01p ~]# dmidecode -t system
# dmidecode 2.12-dmifs
# SMBIOS entry point at 0x7af0a000
SMBIOS 2.8 present.

Handle 0x0100, DMI type 1, 27 bytes
System Information
        Manufacturer: Dell Inc.
        Product Name: PowerEdge R730
        Version: Not Specified
        Serial Number: HG2H8D2
        UUID: 4C4C4544-0047-3210-8048-C8C04F384432
        Wake-up Type: Power Switch
        SKU Number: SKU=NotProvided;ModelName=PowerEdge R730
        Family: Not Specified

Handle 0x0C00, DMI type 12, 5 bytes
System Configuration Options
        Option 1: NVRAM_CLR: Clear user settable NVRAM areas and set defaults
        Option 2: PWRD_EN: Close to enable password

Handle 0x2000, DMI type 32, 11 bytes
System Boot Information
        Status: No errors detected

[root@ds-cassandra01p ~]# cat /etc/redhat-release
Red Hat Enterprise Linux Server release 7.2 (Maipo)
[root@ds-cassandra01p ~]#

................................................................................
................................................................................

From: Belogrud Sergey Vladimirovich
Sent: Tuesday, September 06, 2016 4:01 PM
To: Bezrukikh Georgiy Gennadyevich
Cc: Zbiranik Evgeniy Aleksandrovich; dwh-adm; Matveev Danila Yuryevich; Bukovnya Sergey Nikolaevich
Subject: RE: Вопрос по серверу.

Хорошо.
Спасибо.
Тогда займусь им через 15 минут.
С 16:15 то есть.

Сергей Белогруд
Старший системный администратор
Тел.: +7 495 648-10-00, доб. 2173

From: Bezrukikh Georgiy Gennadyevich
Sent: Tuesday, September 06, 2016 3:59 PM
To: Belogrud Sergey Vladimirovich
Cc: Zbiranik Evgeniy Aleksandrovich; dwh-adm; Matveev Danila Yuryevich; Bukovnya Sergey Nikolaevich
Subject: RE: Вопрос по серверу.

Можно начинать в любое удобное время. Этим серверов пока никто не пользуется. Просьба только прислать уведомление о начале и окончании работ.


Георгий Безруких
Системный администратор

From: Belogrud Sergey Vladimirovich
Sent: Tuesday, September 06, 2016 3:55 PM
To: Bezrukikh Georgiy Gennadyevich <g.bezrukikh@tinkoff.ru>
Cc: Zbiranik Evgeniy Aleksandrovich <e.zbiranik@tinkoff.ru>; dwh-adm <dwh-adm@tinkoff.ru>; Matveev Danila Yuryevich <d.y.matveev@tinkoff.ru>; Bukovnya Sergey Nikolaevich <s.bukovnya@tinkoff.ru>
Subject: RE: Вопрос по серверу.

Добрый день.

Так, что по downtime сервера ds-cassandra01p?
Когда можно будет им с часок позаниматься?

Сергей Белогруд
Старший системный администратор
Тел.: +7 495 648-10-00, доб. 2173

From: Belogrud Sergey Vladimirovich
Sent: Monday, September 05, 2016 5:44 PM
To: Bezrukikh Georgiy Gennadyevich
Cc: Zbiranik Evgeniy Aleksandrovich; dwh-adm; Matveev Danila Yuryevich; Bukovnya Sergey Nikolaevich
Subject: RE: Вопрос по серверу.

Серёга Буковня проверил – с его стороны всё в порядке.
Значит нужно ковыряться с сервером…

Что скажете по планам на downtime?

Сергей Белогруд
Старший системный администратор
Тел.: +7 495 648-10-00, доб. 2173

From: Belogrud Sergey Vladimirovich
Sent: Monday, September 05, 2016 5:26 PM
To: Bezrukikh Georgiy Gennadyevich
Cc: Zbiranik Evgeniy Aleksandrovich; dwh-adm; Matveev Danila Yuryevich; Bukovnya Sergey Nikolaevich
Subject: RE: Вопрос по серверу.

Вероятно около часа (возможно быстрее).
Точно пока не понятно что с ним и как это лечить. Возможно Серёга Буковня заметит отклонения в сетевых доступах, пропишет, что нужно и вопрос вообще снимется.
Так, что сначала Серёга Буковня со своей стороны на этот предмет взглянет.
Но хотелось бы знать примерно на когда и на восколько можно ожидать возможность позаниматься сервером.

From: Bezrukikh Georgiy Gennadyevich
Sent: Monday, September 05, 2016 5:22 PM
To: Belogrud Sergey Vladimirovich
Cc: Zbiranik Evgeniy Aleksandrovich; dwh-adm; Matveev Danila Yuryevich
Subject: RE: Вопрос по серверу.

Привет.

А сколько по времени займет недоступность сервере? Можно согласовать работы со мной и Данилой Матвеевым.


Георгий Безруких
Системный администратор

From: Belogrud Sergey Vladimirovich
Sent: Monday, September 05, 2016 5:20 PM
To: dwh-adm <dwh-adm@tinkoff.ru>
Cc: Zbiranik Evgeniy Aleksandrovich <e.zbiranik@tinkoff.ru>
Subject: Вопрос по серверу.

Добрый день коллеги.

Есть необходимость позаниматься обновлением firmware на сервере ds-cassandra01p.tcsbank.ru.
Как-то он себя не очень адекватно ведёт по части проверки состояния его оборудования специализированным ПО от Dell.
Подробности по серверу:


С кем можно запланировать работы на сервере?

С уважением,

Сергей Белогруд
Старший системный администратор


................................................................................

#   hg2h8d2 (cassandra) server

Starting deploy server configuration task 'Deploy Template - Deploy Template Task - 09/01/2016 11:36:40'.
Using Compute Pool: common config (ID=4)
Using Template: PowerEdge R730xd - iDRAC - common config (ID=882)
Using Identity Set: None (manual identity assignment)
Boot-to-Network-ISO after deploy: No
Shutdown mode: Graceful-then-Forced (2)


Doing task-specific processing...
    This task will use manually-assigned virtual identities.
Done with task-specific processing


* Deploying the template...

Network share IP for this task: 10.216.43.159

Retrieved the file share settings.
Deploy server config returned an error:
> Return Code = 2
> Message = Server has pending or commited system configuration.
> Message ID = LC068
File clean up failed : The system cannot find the file specified

> Template deployment failed.
A deployment job could not be created on the iDRAC.
- Template validation will be skipped




Starting deploy server configuration task 'Deploy Template - Deploy Template Task - 09/06/2016 17:55:07'.
Using Compute Pool: common config (ID=4)
Using Template: PowerEdge R730xd - iDRAC - common config (ID=882)
Using Identity Set: None (manual identity assignment)
Boot-to-Network-ISO after deploy: No
Shutdown mode: Graceful-then-Forced (2)


Doing task-specific processing...
    This task will use manually-assigned virtual identities.
Done with task-specific processing


* Deploying the template...

Network share IP for this task: 10.216.43.159

Retrieved the file share settings.
Deploy server config returned an error:
> Return Code = 2
> Message = Server has pending or commited system configuration.
> Message ID = LC068
File clean up failed : The system cannot find the file specified

> Template deployment failed.
A deployment job could not be created on the iDRAC.
- Template validation will be skipped

[support@centos00 20160815-1714]$ ssh tcsbank.ru\\s.belogrud@hg2h8d2.mgmt.tcsbank.ru
tcsbank.ru\s.belogrud@hg2h8d2.mgmt.tcsbank.ru's password:
/admin1-> racadm
racadm>>racreset
racadm racreset
RAC reset operation initiated successfully. It may take a few
 minutes for the RAC to come online again.
racadm>>quit

/admin1-> exit
CLP Session terminated
Connection to hg2h8d2.mgmt.tcsbank.ru closed.
[support@centos00 20160815-1714]$


Starting deploy server configuration task 'Deploy Template - Deploy Template Task - 09/06/2016 18:17:33'.
Using Compute Pool: common config (ID=4)
Using Template: PowerEdge R730xd - iDRAC - common config (ID=882)
Using Identity Set: None (manual identity assignment)
Boot-to-Network-ISO after deploy: No
Shutdown mode: Graceful-then-Forced (2)


Doing task-specific processing...
    This task will use manually-assigned virtual identities.
Done with task-specific processing


* Deploying the template...

Network share IP for this task: 10.216.43.159

Retrieved the file share settings.
Deploy server config returned an error:
> Return Code = 2
> Message = Server has pending or commited system configuration.
> Message ID = LC068
File clean up failed : The system cannot find the file specified

> Template deployment failed.
A deployment job could not be created on the iDRAC.
- Template validation will be skipped

................................................................................

From: Dell_TechDirect@TechDirect.Dell.com [mailto:Dell_TechDirect@TechDirect.Dell.com]
Sent: Tuesday, September 06, 2016 6:44 PM
To: Belogrud Sergey Vladimirovich
Cc: Belogrud Sergey Vladimirovich
Subject: Dell TechDirect Дело о поддержке Успешное создание

Уважаемый(-ая) Sergey Belogrud!
Ваш запрос успешно создан и отправлен в нашу службу технической поддержки. Специалист службы технической поддержки Dell свяжется с Вами для решения Вашего вопроса. Ход выполнения запроса можно также отслеживать в панели мониторинга.
ИД дела:    935708763
Дата запроса:   06.09.2016
Метка обслуживания: HG2H8D2
Благодарим Вас,
команда Dell TechDirect


................................................................................


https://hg2h8d2.mgmt.tcsbank.ru

................................................................................

[support@centos00 20160815-1714]$ SSHPASS="$(pass common/windows-current)" sshpass -e ssh -t -oStrictHostKeyChecking=no tcsbank.ru\\s.belogrud@hg2h8d2.mgmt.tcsbank.ru racadm getsysinfo | tee -a /tmp/$(date +%Y%m%d-%H%M).getsysinfo.hg2h8d2.log

RAC Information:
RAC Date/Time           = Tue Sep 13 15:29:57 2016

Firmware Version        = 2.30.30.30
Firmware Build          = 50
Last Firmware Update    = 01/22/2016 20:53:10
Hardware Version        = 0.01
MAC Address             = 18:FB:7B:A5:B2:69

Common settings:
Register DNS RAC Name   = 0
DNS RAC Name            = idrac-HG2H8D2
Current DNS Domain      =
Domain Name from DHCP   = Disabled

IPv4 settings:
Enabled                 = 1
Current IP Address      = 10.219.11.2
Current IP Gateway      = 10.219.11.254
Current IP Netmask      = 255.255.255.0
DHCP Enabled            = 0
Current DNS Server 1    = 10.216.40.4
Current DNS Server 2    = 10.216.42.5
DNS Servers from DHCP   = Disabled

IPv6 settings:
Enabled                 = 0
Current IP Address 1    = ::
Current IP Gateway      = ::
Autoconfig              = 1
Link Local IP Address   = ::
Current IP Address 2    = ::
Current IP Address 3    = ::
Current IP Address 4    = ::
Current IP Address 5    = ::
Current IP Address 6    = ::
Current IP Address 7    = ::
Current IP Address 8    = ::
Current IP Address 9    = ::
Current IP Address 10   = ::
Current IP Address 11   = ::
Current IP Address 12   = ::
Current IP Address 13   = ::
Current IP Address 14   = ::
Current IP Address 15   = ::
DNS Servers from DHCPv6 = Disabled
Current DNS Server 1    = ::
Current DNS Server 2    = ::

System Information:
System Model            = PowerEdge R730
System Revision         = I
System BIOS Version     = 2.1.7
Service Tag             = HG2H8D2
Express Svc Code        = 37976921750
Host Name               = ds-cassandra01p.tcsbank.ru
OS Name                 = Red Hat Enterprise Linux Server
OS Version              = release 7.2 (Maipo) Kernel 3.10.0-327.22.2.el7.x86_64 (x86_64)
Power Status            = ON
Fresh Air Capable       = Yes

Watchdog Information:
Recovery Action         = None
Present countdown value = 476 seconds
Initial countdown value = 480 seconds

System Thermal Information:
EstimatedSystemAirflow  =  27 CFM
EstimatedExhaustTemperature =  35 Degrees Centigrade

Embedded NIC MAC Addresses:
NIC.Integrated.1-1-1    Ethernet                = 18:66:DA:58:D1:F4
                        iSCSI                   = 18:66:DA:58:D1:F5
                        FIP                     = 18:66:DA:58:D1:F5
                        WWN                     = 20:00:18:66:DA:58:D1:F5
                        WWPN                    = 20:01:18:66:DA:58:D1:F5
NIC.Integrated.1-2-1    Ethernet                = 18:66:DA:58:D1:F6
                        iSCSI                   = 18:66:DA:58:D1:F7
                        FIP                     = 18:66:DA:58:D1:F7
                        WWN                     = 20:00:18:66:DA:58:D1:F7
                        WWPN                    = 20:01:18:66:DA:58:D1:F7
NIC.Integrated.1-3-1    Ethernet                = 18:66:DA:58:D1:F8
                        iSCSI                   = 18:66:DA:58:D1:F9
                        FIP                     = 18:66:DA:58:D1:F9
                        WWPN                    = 20:01:18:66:DA:58:D1:F9
NIC.Integrated.1-4-1    Ethernet                = 18:66:DA:58:D1:FA
                        iSCSI                   = 18:66:DA:58:D1:FB
                        FIP                     = 18:66:DA:58:D1:FB
                        WWPN                    = 20:01:18:66:DA:58:D1:FB

Connection to hg2h8d2.mgmt.tcsbank.ru closed.
[support@centos00 20160815-1714]$ SSHPASS="$(pass common/windows-current)" sshpass -e ssh -t -oStrictHostKeyChecking=no tcsbank.ru\\s.belogrud@hg2h8d2.mgmt.tcsbank.ru racadm getsysinfo | tee -a /tmp/$(date +%Y%m%d-%H%M).getsysinfo.hg2h8d2.log

[support@centos00 20160815-1714]$ SSHPASS="$(pass common/windows-current)" sshpass -e ssh -t -oStrictHostKeyChecking=no tcsbank.ru\\s.belogrud@hg2h8d2.mgmt.tcsbank.ru racadm jobqueue delete -i JID_CLEARALL_FORCE | tee -a /tmp/$(date +%Y%m%d-%H%M).getsysinfo.hg2h8d2.log
Created Job Identifier:
RAC1032: JID_CLEARALL_FORCE job(s) was cancelled by the user.
Connection to hg2h8d2.mgmt.tcsbank.ru closed.
[support@centos00 20160815-1714]$



