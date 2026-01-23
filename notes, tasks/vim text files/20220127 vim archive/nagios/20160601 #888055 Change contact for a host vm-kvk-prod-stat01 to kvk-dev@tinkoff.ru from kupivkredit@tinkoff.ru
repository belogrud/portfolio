



[root@vm-vol-nag4-tst objects]# cat ./servers/vmware/vm-kvk-prod-stat01.cfg
define host{
    use                             linux-server
    host_name                       vm-kvk-prod-stat01
    alias                           vm-kvk-prod-stat01
    address                         10.218.1.22
    hostgroups                      kvk-servers
    contact_groups                  kupivkredit-development
}
define service{
    use                             generic-service
    host_name                       vm-kvk-prod-stat01
    service_description             PING
    check_command                   check_ping!100.0,20%!500.0,60%
    contacts                d.buynov_email, d.buynov_sms
    contact_groups          kupivkredit-development
}
define service{
    use                             generic-service
    host_name                       vm-kvk-prod-stat01
    service_description             Root Partition
    check_command                   check_nrpe!check_root_fs
    contacts                d.buynov_email, d.buynov_sms
    contact_groups          linux-admins, kupivkredit-development
}
define service{
    use                             generic-service
    host_name                       vm-kvk-prod-stat01
    service_description             Boot Partition
    check_command                   check_nrpe!check_boot_fs
    contacts                d.buynov_email, d.buynov_sms
    contact_groups          linux-admins, kupivkredit-development
}
define service{
    use                             generic-service
    host_name                       vm-kvk-prod-stat01
    service_description             VAR Partition
    check_command                   check_nrpe!check_var_fs
    contacts                d.buynov_email, d.buynov_sms
    contact_groups          linux-admins, kupivkredit-development
}
define service{
    use                             generic-service
    host_name                       vm-kvk-prod-stat01
    service_description             Current Load
    check_command                   check_nrpe!check_load
    contacts                d.buynov_email, d.buynov_sms
    contact_groups          linux-admins, kupivkredit-development
}
...


[root@vm-vol-nag4-tst objects]# pynag list members filename where contactgroup_name="kupivkredit-development"
members              filename
--------------------------------------------------------------------------------
kupivkredit_email, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms, servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical /usr/local/nagios/etc/objects/groups/contact-group/kupivkredit-development.cfg
----------1 objects matches search condition------------------------------------
[root@vm-vol-nag4-tst objects]# pynag list contact_name email filename where contact_name__contains="kupivkredit_email"
contact_name         email                filename
--------------------------------------------------------------------------------
kupivkredit_email    kupivkredit@tcsbank.ru /usr/local/nagios/etc/objects/contacts/kupivkredit.cfg
----------1 objects matches search condition------------------------------------
[root@vm-vol-nag4-tst objects]#


[root@vm-vol-nag4-tst objects]# pynag list contact_name email filename where email__contains="kvk-dev"
contact_name         email                filename
--------------------------------------------------------------------------------
----------0 objects matches search condition------------------------------------
[root@vm-vol-nag4-tst objects]#


................................................................................
................................................................................


[root@vm-vol-nag4-tst objects]# cp /usr/local/nagios/etc/objects/contacts/{kupivkredit,kvk-dev}.cfg

................................................................................
................................................................................


[root@vm-vol-nag4-tst objects]# service nagios checkconfig && service nagios reload
Running configuration check...
 OK.
Running configuration check...
Reloading nagios configuration...
done
[root@vm-vol-nag4-tst objects]#

[root@vm-vol-nag4-tst objects]# git commit --author='Sergey Belogrud <s.belogrud@tinkoff.ru>' -m "SD#888055. Change contact for host vm-kvk-prod-stat01 to kvk-dev@tinkoff.ru instead existed kupivkredit@tinkoff.ru." contacts/kvk-dev.cfg servers/vmware/vm-kvk-prod-stat01.cfg
[master 5309969] SD#888055. Change contact for host vm-kvk-prod-stat01 to kvk-dev@tinkoff.ru instead existed kupivkredit@tinkoff.ru.
 Author: Sergey Belogrud <s.belogrud@tinkoff.ru>
 2 files changed, 24 insertions(+), 17 deletions(-)
 create mode 100644 objects/contacts/kvk-dev.cfg
[root@vm-vol-nag4-tst objects]#


................................................................................

[root@vm-vol-nag4-tst objects]# cat contacts/kvk-dev.cfg
define contact{
        contact_name                    kvk-dev_email
        use                             generic-contact-critical-email
        alias                           kvk development group
        email                           kvk-dev@tinkoff.ru
}
[root@vm-vol-nag4-tst objects]#


[root@vm-vol-nag4-tst objects]# cat contacts/kvk-dev.cfg
define contact{
        contact_name                    kvk-dev_email
        use                             generic-contact-critical-email
        alias                           kvk development group
        email                           kvk-dev@tinkoff.ru
}
[root@vm-vol-nag4-tst objects]# head -n 15 servers/vmware/vm-kvk-prod-stat01.cfg
define host{
    use                             linux-server
    host_name                       vm-kvk-prod-stat01
    alias                           vm-kvk-prod-stat01
    address                         10.218.1.22
    hostgroups                      kvk-servers
    contacts                        g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
    contact_groups                  empty-group
}
define service{
    use                             generic-service
    host_name                       vm-kvk-prod-stat01
    service_description             PING
    check_command                   check_ping!100.0,20%!500.0,60%
    contacts                d.buynov_email, d.buynov_sms, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
[root@vm-vol-nag4-tst objects]#

................................................................................
................................................................................


[root@vm-vol-nag4-tst objects]# server_name="vm-kvk-prod-stat01" ; pynag list host_name service_description contact_groups contacts where host_name="${server_name}" ; pynag list display_name address filename where object_type=host and host_name="${server_name}"
host_name            service_description  contact_groups       contacts
--------------------------------------------------------------------------------
vm-kvk-prod-stat01   null                 empty-group          g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
vm-kvk-prod-stat01   Boot Partition       linux-admins         d.buynov_email, d.buynov_sms, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
vm-kvk-prod-stat01   Check Zombie procs   linux-admins         d.buynov_email, d.buynov_sms, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
vm-kvk-prod-stat01   Current Load         linux-admins         d.buynov_email, d.buynov_sms, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
vm-kvk-prod-stat01   Current Memory Load  linux-admins         d.buynov_email, d.buynov_sms, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
vm-kvk-prod-stat01   HTTP                 empty-group          d.buynov_email, d.buynov_sms, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
vm-kvk-prod-stat01   PING                 empty-group          d.buynov_email, d.buynov_sms, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
vm-kvk-prod-stat01   Root Partition       linux-admins         d.buynov_email, d.buynov_sms,g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
vm-kvk-prod-stat01   VAR Partition        linux-admins         d.buynov_email, d.buynov_sms, g.barykin_email, g.barykin_sms, v.kovalenko_email, v.kovalenko_sms, a.rozenvasser_email, a.rozenvasser_sms, v.uspenskiy_email, v.uspenskiy_sms, n.aboltin_email, n.aboltin_sms,servicedesk_duty_sms_critical, servicedesk_duty_khutor_sms_critical,kvk-dev_email
----------9 objects matches search condition------------------------------------
display_name         address              filename
--------------------------------------------------------------------------------
null                 10.218.1.22          /usr/local/nagios/etc/objects/servers/vmware/vm-kvk-prod-stat01.cfg
----------1 objects matches search condition------------------------------------
[root@vm-vol-nag4-tst objects]#









