
...........................................................................

sudo apt-get update
sudo apt-get install openvpn easy-rsa

root@ds-advert-prod-vault-1:~# make-cadir ~/openvpn-ca
root@ds-advert-prod-vault-1:~# cd ~/openvpn-ca
root@ds-advert-prod-vault-1:~/openvpn-ca#

root@ds-advert-prod-vault-1:~/openvpn-ca# vim vars
...
# These are the default values for fields
# which will be placed in the certificate.
# Don't leave any of these fields blank.
export KEY_COUNTRY="RU"
export KEY_PROVINCE="MSK"
export KEY_CITY="Moscow"
export KEY_ORG="Vodny"
export KEY_EMAIL="unix-admins@tinkoff.ru"
export KEY_OU="Tinkoff Bank"
...
# X509 Subject Field
export KEY_NAME="server"
...

root@ds-advert-prod-vault-1:~/openvpn-ca# ls -Alh
total 36K
lrwxrwxrwx 1 root root   28 Apr 12 11:43 build-ca -> /usr/share/easy-rsa/build-ca
lrwxrwxrwx 1 root root   28 Apr 12 11:43 build-dh -> /usr/share/easy-rsa/build-dh
lrwxrwxrwx 1 root root   31 Apr 12 11:43 build-inter -> /usr/share/easy-rsa/build-inter
lrwxrwxrwx 1 root root   29 Apr 12 11:43 build-key -> /usr/share/easy-rsa/build-key
lrwxrwxrwx 1 root root   34 Apr 12 11:43 build-key-pass -> /usr/share/easy-rsa/build-key-pass
lrwxrwxrwx 1 root root   36 Apr 12 11:43 build-key-pkcs12 -> /usr/share/easy-rsa/build-key-pkcs12
lrwxrwxrwx 1 root root   36 Apr 12 11:43 build-key-server -> /usr/share/easy-rsa/build-key-server
lrwxrwxrwx 1 root root   29 Apr 12 11:43 build-req -> /usr/share/easy-rsa/build-req
lrwxrwxrwx 1 root root   34 Apr 12 11:43 build-req-pass -> /usr/share/easy-rsa/build-req-pass
lrwxrwxrwx 1 root root   29 Apr 12 11:43 clean-all -> /usr/share/easy-rsa/clean-all
lrwxrwxrwx 1 root root   33 Apr 12 11:43 inherit-inter -> /usr/share/easy-rsa/inherit-inter
lrwxrwxrwx 1 root root   28 Apr 12 11:43 list-crl -> /usr/share/easy-rsa/list-crl
-rw-r--r-- 1 root root 7.7K Apr 12 11:43 openssl-0.9.6.cnf
-rw-r--r-- 1 root root 8.3K Apr 12 11:43 openssl-0.9.8.cnf
-rw-r--r-- 1 root root 8.2K Apr 12 11:43 openssl-1.0.0.cnf
lrwxrwxrwx 1 root root   27 Apr 12 11:43 pkitool -> /usr/share/easy-rsa/pkitool
lrwxrwxrwx 1 root root   31 Apr 12 11:43 revoke-full -> /usr/share/easy-rsa/revoke-full
lrwxrwxrwx 1 root root   28 Apr 12 11:43 sign-req -> /usr/share/easy-rsa/sign-req
-rw-r--r-- 1 root root 2.1K Apr 12 11:52 vars
lrwxrwxrwx 1 root root   35 Apr 12 11:43 whichopensslcnf -> /usr/share/easy-rsa/whichopensslcnf
root@ds-advert-prod-vault-1:~/openvpn-ca#

...........................................................................


root@ds-advert-prod-vault-1:~/openvpn-ca# source vars
NOTE: If you run ./clean-all, I will be doing a rm -rf on /root/openvpn-ca/keys
root@ds-advert-prod-vault-1:~/openvpn-ca#

...........................................................................

root@ds-advert-prod-vault-1:~/openvpn-ca# ./clean-all
root@ds-advert-prod-vault-1:~/openvpn-ca# ./build-ca
Generating a 2048 bit RSA private key
....+++
...................+++
writing new private key to 'ca.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [RU]:
State or Province Name (full name) [MSK]:
Locality Name (eg, city) [Moscow]:
Organization Name (eg, company) [Vodny]:
Organizational Unit Name (eg, section) [Tinkoff Bank]:
Common Name (eg, your name or your server's hostname) [Vodny CA]:
Name [server]:
Email Address [unix-admins@tinkoff.ru]:
root@ds-advert-prod-vault-1:~/openvpn-ca#


root@ds-advert-prod-vault-1:~/openvpn-ca# ./build-key-server server
Generating a 2048 bit RSA private key
....+++
..................................................................+++
writing new private key to 'server.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [RU]:
State or Province Name (full name) [MSK]:
Locality Name (eg, city) [Moscow]:
Organization Name (eg, company) [Vodny]:
Organizational Unit Name (eg, section) [Tinkoff Bank]:
Common Name (eg, your name or your server's hostname) [server]:
Name [server]:
Email Address [unix-admins@tinkoff.ru]:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Using configuration from /root/openvpn-ca/openssl-1.0.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'RU'
stateOrProvinceName   :PRINTABLE:'MSK'
localityName          :PRINTABLE:'Moscow'
organizationName      :PRINTABLE:'Vodny'
organizationalUnitName:PRINTABLE:'Tinkoff Bank'
commonName            :PRINTABLE:'server'
name                  :PRINTABLE:'server'
emailAddress          :IA5STRING:'unix-admins@tinkoff.ru'
Certificate is to be certified until Apr  9 08:59:05 2029 GMT (3650 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
root@ds-advert-prod-vault-1:~/openvpn-ca#

root@ds-advert-prod-vault-1:~/openvpn-ca# ./build-dh
Generating DH parameters, 2048 bit long safe prime, generator 2
This is going to take a long time
..........................................................................................................................................................+.....................................+............+...........................................+..............+............................................................................................................................................................
...
..............+........+....................................................................................................................................+.......+............................................++*++*
root@ds-advert-prod-vault-1:~/openvpn-ca#


root@ds-advert-prod-vault-1:~/openvpn-ca# openvpn --genkey --secret keys/ta.key

.......................................................................................

root@ds-advert-prod-vault-1:~/openvpn-ca# cd ~/openvpn-ca
root@ds-advert-prod-vault-1:~/openvpn-ca# source vars
NOTE: If you run ./clean-all, I will be doing a rm -rf on /root/openvpn-ca/keys
root@ds-advert-prod-vault-1:~/openvpn-ca# ./build-key client1
Generating a 2048 bit RSA private key
..........................+++
...............................................................+++
writing new private key to 'client1.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [RU]:
State or Province Name (full name) [MSK]:
Locality Name (eg, city) [Moscow]:
Organization Name (eg, company) [Vodny]:
Organizational Unit Name (eg, section) [Tinkoff Bank]:
Common Name (eg, your name or your server's hostname) [client1]:
Name [server]:
Email Address [unix-admins@tinkoff.ru]:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Using configuration from /root/openvpn-ca/openssl-1.0.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'RU'
stateOrProvinceName   :PRINTABLE:'MSK'
localityName          :PRINTABLE:'Moscow'
organizationName      :PRINTABLE:'Vodny'
organizationalUnitName:PRINTABLE:'Tinkoff Bank'
commonName            :PRINTABLE:'client1'
name                  :PRINTABLE:'server'
emailAddress          :IA5STRING:'unix-admins@tinkoff.ru'
Certificate is to be certified until Apr  9 09:23:50 2029 GMT (3650 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
root@ds-advert-prod-vault-1:~/openvpn-ca#

................................................................................

root@ds-advert-prod-vault-1:~/openvpn-ca# ls -Alh ~/openvpn-ca/keys/
total 88K
-rw-r--r-- 1 root root 5.5K Apr 12 11:59 01.pem
-rw-r--r-- 1 root root 5.4K Apr 12 12:23 02.pem
-rw-r--r-- 1 root root 1.7K Apr 12 11:57 ca.crt
-rw------- 1 root root 1.7K Apr 12 11:57 ca.key
-rw-r--r-- 1 root root 5.4K Apr 12 12:23 client1.crt
-rw-r--r-- 1 root root 1.1K Apr 12 12:23 client1.csr
-rw------- 1 root root 1.7K Apr 12 12:23 client1.key
-rw-r--r-- 1 root root  424 Apr 12 12:02 dh2048.pem
-rw-r--r-- 1 root root  265 Apr 12 12:23 index.txt
-rw-r--r-- 1 root root   21 Apr 12 12:23 index.txt.attr
-rw-r--r-- 1 root root   21 Apr 12 11:59 index.txt.attr.old
-rw-r--r-- 1 root root  132 Apr 12 11:59 index.txt.old
-rw-r--r-- 1 root root    3 Apr 12 12:23 serial
-rw-r--r-- 1 root root    3 Apr 12 11:59 serial.old
-rw-r--r-- 1 root root 5.5K Apr 12 11:59 server.crt
-rw-r--r-- 1 root root 1.1K Apr 12 11:59 server.csr
-rw------- 1 root root 1.7K Apr 12 11:59 server.key
-rw------- 1 root root  636 Apr 12 12:06 ta.key
root@ds-advert-prod-vault-1:~/openvpn-ca#

root@ds-advert-prod-vault-1:~/openvpn-ca# cd ~/openvpn-ca/keys
root@ds-advert-prod-vault-1:~/openvpn-ca/keys# cp ca.crt ca.key server.crt server.key ta.key dh2048.pem /etc/openvpn/

root@ds-advert-prod-vault-1:~/openvpn-ca/keys# gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz | tee /etc/openvpn/server.conf

root@ds-advert-prod-vault-1:~/openvpn-ca/keys# vim /etc/openvpn/server.conf
...
tls-auth ta.key 0 # This file is secret
key-direction 0
...
cipher AES-128-CBC   # AES
auth SHA256
...
user nobody
group nogroup

................................................................................

root@ds-advert-prod-vault-1:~# systemctl start openvpn@server
root@ds-advert-prod-vault-1:~# systemctl status openvpn@server
? openvpn@server.service - OpenVPN connection to server
   Loaded: loaded (/lib/systemd/system/openvpn@.service; disabled; vendor preset: enabled)
   Active: active (running) since Fri 2019-04-12 14:56:34 MSK; 6s ago
     Docs: man:openvpn(8)
           https://community.openvpn.net/openvpn/wiki/Openvpn23ManPage
           https://community.openvpn.net/openvpn/wiki/HOWTO
  Process: 12725 ExecStart=/usr/sbin/openvpn --daemon ovpn-%i --status /run/openvpn/%i.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/%i.conf --writepid /run/openvpn/%i.pid
 Main PID: 12727 (openvpn)
   CGroup: /system.slice/system-openvpn.slice/openvpn@server.service
           L-12727 /usr/sbin/openvpn --daemon ovpn-server --status /run/openvpn/server.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/server.conf --writepid /run/openvpn/se

Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: /sbin/ip addr add dev tun0 local 10.8.0.1 peer 10.8.0.2
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: /sbin/ip route add 10.8.0.0/24 via 10.8.0.2
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: GID set to nogroup
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: UID set to nobody
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: UDPv4 link local (bound): [undef]
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: UDPv4 link remote: [undef]
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: MULTI: multi_init called, r=256 v=256
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: IFCONFIG POOL: base=10.8.0.4 size=62, ipv6=0
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: IFCONFIG POOL LIST
Apr 12 14:56:34 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[12727]: Initialization Sequence Completed
root@ds-advert-prod-vault-1:~#

root@ds-advert-prod-vault-1:~# ip -f inet addr show tun0
3: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 100
    inet 10.8.0.1 peer 10.8.0.2/32 scope global tun0
       valid_lft forever preferred_lft forever
root@ds-advert-prod-vault-1:~#

root@ds-advert-prod-vault-1:~# systemctl enable openvpn@server
Created symlink from /etc/systemd/system/multi-user.target.wants/openvpn@server.service to /lib/systemd/system/openvpn@.service.
root@ds-advert-prod-vault-1:~#

................................................................................

root@ds-advert-prod-vault-1:~# mkdir -p ~/client-configs/files
root@ds-advert-prod-vault-1:~# chmod 700 ~/client-configs/files
root@ds-advert-prod-vault-1:~# cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf ~/client-configs/base.conf

root@ds-advert-prod-vault-1:~# vim ~/client-configs/base.conf
...
# The hostname/IP and port of the server.
# You can have multiple remote entries
# to load balance between the servers.
remote 91.194.227.131 1194
...
# Downgrade privileges after initialization (non-Windows only)
user nobody
group nogroup
...
#ca ca.crt
#cert client.crt
#key client.key
...
# Select a cryptographic cipher.
# If the cipher option is used on the server
# then you must also specify it here.
;cipher x
cipher AES-128-CBC
auth SHA256
...
key-direction 1

# script-security 2
# up /etc/openvpn/update-resolv-conf
# down /etc/openvpn/update-resolv-conf

................................................................................

root@ds-advert-prod-vault-1:~# cd ~/client-configs/
root@ds-advert-prod-vault-1:~/client-configs# vim make_config.sh
#!/bin/bash

# First argument: Client identifier

KEY_DIR=~/openvpn-ca/keys
OUTPUT_DIR=~/client-configs/files
BASE_CONFIG=~/client-configs/base.conf

cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-auth>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-auth>') \
    > ${OUTPUT_DIR}/${1}.ovpn

root@ds-advert-prod-vault-1:~/client-configs# chmod 700 make_config.sh

root@ds-advert-prod-vault-1:~/client-configs# ls -Alh
total 12K
-rw-r--r-- 1 root root 3.6K Apr 12 15:06 base.conf
drwx------ 2 root root 4.0K Apr 12 14:59 files
-rwx------ 1 root root  461 Apr 12 15:41 make_config.sh
root@ds-advert-prod-vault-1:~/client-configs# ls -Alh files/
total 0
root@ds-advert-prod-vault-1:~/client-configs# ./make_config.sh client1
root@ds-advert-prod-vault-1:~/client-configs# ls -Alh files/
total 16K
-rw-r--r-- 1 root root 13K Apr 12 15:42 client1.ovpn
root@ds-advert-prod-vault-1:~/client-configs#

................................................................................

root@ds-advert-prod-vault-1:~# cp client-configs/files/client1.ovpn /tmp/

[s.belogrud@TCS4357]# scp bsv@ds-advert-prod-vault-1:/tmp/client1.ovpn /drives/c/Users/s.belogrud/Downloads/
client1.ovpn                                                                                                                                                     100%   13KB  12.9KB/s   00:00
[s.belogrud@TCS4357]#

[s.belogrud@TCS4357]# scp /drives/c/Users/s.belogrud/Downloads/client1.ovpn bsv@bk1.datamind.ru:
client1.ovpn                                                                                                                                                     100%   13KB  12.9KB/s   00:00
[s.belogrud@TCS4357]#

bsv@bk1:~$ scp client1.ovpn s.belogrud@prod-hzeu-rtb-infra-ops-1.datamind.ru:
Warning: Permanently added 'prod-hzeu-rtb-infra-ops-1.datamind.ru,148.251.6.45' (ECDSA) to the list of known hosts.
client1.ovpn                                                                                                                                                     100%   13KB  12.9KB/s   00:00
bsv@bk1:~$


bsv@bk1:~$ ssh s.belogrud@prod-hzeu-rtb-infra-ops-1.datamind.ru
root@prod-hzeu-rtb-infra-ops-1 ~ # mkdir -p client-configs/files/
root@prod-hzeu-rtb-infra-ops-1 ~ # cp ~s.belogrud/client1.ovpn client-configs/files/

root@prod-hzeu-rtb-infra-ops-1 ~ # apt-get update
root@prod-hzeu-rtb-infra-ops-1 ~ # apt-get install openvpn

................................................................................

root@prod-hzeu-rtb-infra-ops-1 ~ # ip -f inet addr | grep inet
    inet 127.0.0.1/8 scope host lo
    inet 148.251.6.45/27 brd 148.251.6.63 scope global eth0
    inet 172.17.0.1/16 scope global docker0
    inet 172.150.0.1/16 scope global br-08110f708c85
    inet 172.180.0.1/16 scope global br-1c69554cc0e5
    inet 172.18.0.1/16 scope global br-55c724d21db4
root@prod-hzeu-rtb-infra-ops-1 ~ #

root@prod-hzeu-rtb-infra-ops-1 ~ # ip route
default via 148.251.6.33 dev eth0 onlink
148.251.6.32/27 via 148.251.6.33 dev eth0
148.251.6.32/27 dev eth0  proto kernel  scope link  src 148.251.6.45
172.17.0.0/16 dev docker0  proto kernel  scope link  src 172.17.0.1
172.18.0.0/16 dev br-55c724d21db4  proto kernel  scope link  src 172.18.0.1 linkdown
172.150.0.0/16 dev br-08110f708c85  proto kernel  scope link  src 172.150.0.1 linkdown
172.180.0.0/16 dev br-1c69554cc0e5  proto kernel  scope link  src 172.180.0.1 linkdown
root@prod-hzeu-rtb-infra-ops-1 ~ #

................................................................................

root@prod-hzeu-rtb-infra-ops-1 ~ # cp ~/client-configs/files/client1.ovpn /etc/openvpn/
root@prod-hzeu-rtb-infra-ops-1 ~ # cd /etc/openvpn/
root@prod-hzeu-rtb-infra-ops-1 /etc/openvpn # openvpn --config client1.ovpn
Fri Apr 12 14:01:55 2019 OpenVPN 2.4.3 x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Jun 20 2017
Fri Apr 12 14:01:55 2019 library versions: OpenSSL 1.0.2g  1 Mar 2016, LZO 2.08
Fri Apr 12 14:01:55 2019 Outgoing Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 14:01:55 2019 Incoming Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 14:01:55 2019 TCP/UDP: Preserving recently used remote address: [AF_INET]91.194.227.131:1194
Fri Apr 12 14:01:55 2019 Socket Buffers: R=[212992->212992] S=[212992->212992]
Fri Apr 12 14:01:55 2019 UDP link local: (not bound)
Fri Apr 12 14:01:55 2019 UDP link remote: [AF_INET]91.194.227.131:1194
Fri Apr 12 14:01:55 2019 NOTE: UID/GID downgrade will be delayed because of --client, --pull, or --up-delay

Fri Apr 12 14:02:28 2019 event_wait : Interrupted system call (code=4)
Fri Apr 12 14:02:28 2019 SIGINT[hard,] received, process exiting
root@prod-hzeu-rtb-infra-ops-1 /etc/openvpn #


................................................................................

root@prod-hzeu-rtb-infra-ops-1 /etc/openvpn # openvpn --config client1.ovpn
Fri Apr 12 14:10:21 2019 OpenVPN 2.4.3 x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Jun 20 2017
Fri Apr 12 14:10:21 2019 library versions: OpenSSL 1.0.2g  1 Mar 2016, LZO 2.08
Fri Apr 12 14:10:21 2019 Outgoing Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 14:10:21 2019 Incoming Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 14:10:21 2019 TCP/UDP: Preserving recently used remote address: [AF_INET]91.194.227.131:1194
Fri Apr 12 14:10:21 2019 Socket Buffers: R=[212992->212992] S=[212992->212992]
Fri Apr 12 14:10:21 2019 UDP link local: (not bound)
Fri Apr 12 14:10:21 2019 UDP link remote: [AF_INET]91.194.227.131:1194
Fri Apr 12 14:10:21 2019 NOTE: UID/GID downgrade will be delayed because of --client, --pull, or --up-delay
Fri Apr 12 14:11:22 2019 TLS Error: TLS key negotiation failed to occur within 60 seconds (check your network connectivity)
Fri Apr 12 14:11:22 2019 TLS Error: TLS handshake failed
Fri Apr 12 14:11:22 2019 SIGUSR1[soft,tls-error] received, process restarting
Fri Apr 12 14:11:22 2019 Restart pause, 5 second(s)
Fri Apr 12 14:11:27 2019 TCP/UDP: Preserving recently used remote address: [AF_INET]91.194.227.131:1194
Fri Apr 12 14:11:27 2019 Socket Buffers: R=[212992->212992] S=[212992->212992]
Fri Apr 12 14:11:27 2019 UDP link local: (not bound)
Fri Apr 12 14:11:27 2019 UDP link remote: [AF_INET]91.194.227.131:1194
Fri Apr 12 14:12:27 2019 TLS Error: TLS key negotiation failed to occur within 60 seconds (check your network connectivity)
Fri Apr 12 14:12:27 2019 TLS Error: TLS handshake failed
Fri Apr 12 14:12:27 2019 SIGUSR1[soft,tls-error] received, process restarting
Fri Apr 12 14:12:27 2019 Restart pause, 5 second(s)
Fri Apr 12 14:12:32 2019 TCP/UDP: Preserving recently used remote address: [AF_INET]91.194.227.131:1194
Fri Apr 12 14:12:32 2019 Socket Buffers: R=[212992->212992] S=[212992->212992]
Fri Apr 12 14:12:32 2019 UDP link local: (not bound)
Fri Apr 12 14:12:32 2019 UDP link remote: [AF_INET]91.194.227.131:1194

................................................................................


root@ds-advert-prod-vault-1:/etc/openvpn# systemctl stop openvpn@server
root@ds-advert-prod-vault-1:/etc/openvpn# vim server.conf
root@ds-advert-prod-vault-1:/etc/openvpn# systemctl start openvpn@server
root@ds-advert-prod-vault-1:/etc/openvpn# systemctl status openvpn@server
? openvpn@server.service - OpenVPN connection to server
   Loaded: loaded (/lib/systemd/system/openvpn@.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2019-04-12 21:15:43 MSK; 4s ago
     Docs: man:openvpn(8)
           https://community.openvpn.net/openvpn/wiki/Openvpn23ManPage
           https://community.openvpn.net/openvpn/wiki/HOWTO
  Process: 16100 ExecStart=/usr/sbin/openvpn --daemon ovpn-%i --status /run/openvpn/%i.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/%i.conf --writepid /run/openvpn/%i.pid
 Main PID: 16102 (openvpn)
   CGroup: /system.slice/system-openvpn.slice/openvpn@server.service
           L-16102 /usr/sbin/openvpn --daemon ovpn-server --status /run/openvpn/server.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/server.conf --writepid /run/openvpn/se

Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: UID set to nobody
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: UDPv4 link local (bound): [undef]
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: UDPv4 link remote: [undef]
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: MULTI: multi_init called, r=256 v=256
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: IFCONFIG POOL: base=10.8.0.4 size=62, ipv6=0
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: ifconfig_pool_read(), in='client1,10.8.0.4', TODO: IPv6
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: succeeded -> ifconfig_pool_set()
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: IFCONFIG POOL LIST
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: client1,10.8.0.4
Apr 12 21:15:43 ds-advert-prod-vault-1.tcsbank.ru ovpn-server[16102]: Initialization Sequence Completed

root@ds-advert-prod-vault-1:/etc/openvpn#



root@prod-hzeu-rtb-infra-ops-1 ~ # vim /etc/hosts

root@prod-hzeu-rtb-infra-ops-1 ~ # tail -n 1 /etc/hosts
10.218.9.86 vault-rnd.tcsbank.ru
root@prod-hzeu-rtb-infra-ops-1 ~ #

root@prod-hzeu-rtb-infra-ops-1 ~ # ping -c 3 vault-rnd.tcsbank.ru
PING vault-rnd.tcsbank.ru (10.218.9.86) 56(84) bytes of data.
64 bytes from vault-rnd.tcsbank.ru (10.218.9.86): icmp_seq=1 ttl=64 time=39.8 ms
64 bytes from vault-rnd.tcsbank.ru (10.218.9.86): icmp_seq=2 ttl=64 time=39.8 ms
64 bytes from vault-rnd.tcsbank.ru (10.218.9.86): icmp_seq=3 ttl=64 time=39.8 ms

--- vault-rnd.tcsbank.ru ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 39.819/39.830/39.847/0.012 ms
root@prod-hzeu-rtb-infra-ops-1 ~ #

	................................................................................


root@prod-hzeu-rtb-infra-ops-1 /etc/openvpn # openvpn --config client1.ovpn                                                                                                               [23/1016]
Fri Apr 12 18:16:50 2019 OpenVPN 2.4.3 x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Jun 20 2017
Fri Apr 12 18:16:50 2019 library versions: OpenSSL 1.0.2g  1 Mar 2016, LZO 2.08
Fri Apr 12 18:16:50 2019 Outgoing Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 18:16:50 2019 Incoming Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 18:16:50 2019 TCP/UDP: Preserving recently used remote address: [AF_INET]91.194.226.85:1194
Fri Apr 12 18:16:50 2019 Socket Buffers: R=[212992->212992] S=[212992->212992]
Fri Apr 12 18:16:50 2019 UDP link local: (not bound)
Fri Apr 12 18:16:50 2019 UDP link remote: [AF_INET]91.194.226.85:1194
Fri Apr 12 18:16:50 2019 NOTE: UID/GID downgrade will be delayed because of --client, --pull, or --up-delay
Fri Apr 12 18:16:51 2019 TLS: Initial packet from [AF_INET]91.194.226.85:1194, sid=be250439 b6a2f2f9
Fri Apr 12 18:16:51 2019 VERIFY OK: depth=1, C=RU, ST=MSK, L=Moscow, O=Vodny, OU=Tinkoff Bank, CN=Vodny CA, name=server, emailAddress=unix-admins@tinkoff.ru
Fri Apr 12 18:16:51 2019 VERIFY KU OK
Fri Apr 12 18:16:51 2019 Validating certificate extended key usage
Fri Apr 12 18:16:51 2019 ++ Certificate has EKU (str) TLS Web Server Authentication, expects TLS Web Server Authentication
Fri Apr 12 18:16:51 2019 VERIFY EKU OK
Fri Apr 12 18:16:51 2019 VERIFY OK: depth=0, C=RU, ST=MSK, L=Moscow, O=Vodny, OU=Tinkoff Bank, CN=server, name=server, emailAddress=unix-admins@tinkoff.ru
Fri Apr 12 18:16:51 2019 Control Channel: TLSv1.2, cipher TLSv1/SSLv3 DHE-RSA-AES256-GCM-SHA384, 2048 bit RSA
Fri Apr 12 18:16:51 2019 [server] Peer Connection Initiated with [AF_INET]91.194.226.85:1194
Fri Apr 12 18:16:52 2019 SENT CONTROL [server]: 'PUSH_REQUEST' (status=1)
Fri Apr 12 18:16:52 2019 PUSH: Received control message: 'PUSH_REPLY,route 10.218.9.86 255.255.255.255,route 10.8.0.1,topology net30,ping 10,ping-restart 120,ifconfig 10.8.0.6 10.8.0.5'
Fri Apr 12 18:16:52 2019 OPTIONS IMPORT: timers and/or timeouts modified
Fri Apr 12 18:16:52 2019 OPTIONS IMPORT: --ifconfig/up options modified
Fri Apr 12 18:16:52 2019 OPTIONS IMPORT: route options modified
Fri Apr 12 18:16:52 2019 Data Channel Encrypt: Cipher 'AES-128-CBC' initialized with 128 bit key
Fri Apr 12 18:16:52 2019 Data Channel Encrypt: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 18:16:52 2019 Data Channel Decrypt: Cipher 'AES-128-CBC' initialized with 128 bit key
Fri Apr 12 18:16:52 2019 Data Channel Decrypt: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 18:16:52 2019 ROUTE_GATEWAY 148.251.6.33/255.255.255.224 IFACE=eth0 HWADDR=d4:3d:7e:ed:0d:9b
Fri Apr 12 18:16:52 2019 TUN/TAP device tun0 opened
Fri Apr 12 18:16:52 2019 TUN/TAP TX queue length set to 100
Fri Apr 12 18:16:52 2019 do_ifconfig, tt->did_ifconfig_ipv6_setup=0
Fri Apr 12 18:16:52 2019 /sbin/ip link set dev tun0 up mtu 1500
Fri Apr 12 18:16:52 2019 /sbin/ip addr add dev tun0 local 10.8.0.6 peer 10.8.0.5
Fri Apr 12 18:16:52 2019 /sbin/ip route add 10.218.9.86/32 via 10.8.0.5
Fri Apr 12 18:16:52 2019 /sbin/ip route add 10.8.0.1/32 via 10.8.0.5
Fri Apr 12 18:16:52 2019 GID set to nogroup
Fri Apr 12 18:16:52 2019 UID set to nobody
Fri Apr 12 18:16:52 2019 WARNING: this configuration may cache passwords in memory -- use the auth-nocache option to prevent this
Fri Apr 12 18:16:52 2019 Initialization Sequence Completed
kFri Apr 12 19:16:51 2019 TLS: soft reset sec=0 bytes=68780/-1 pkts=760/0
Fri Apr 12 19:16:51 2019 VERIFY OK: depth=1, C=RU, ST=MSK, L=Moscow, O=Vodny, OU=Tinkoff Bank, CN=Vodny CA, name=server, emailAddress=unix-admins@tinkoff.ru
Fri Apr 12 19:16:51 2019 VERIFY KU OK
Fri Apr 12 19:16:51 2019 Validating certificate extended key usage
Fri Apr 12 19:16:51 2019 ++ Certificate has EKU (str) TLS Web Server Authentication, expects TLS Web Server Authentication
Fri Apr 12 19:16:51 2019 VERIFY EKU OK
Fri Apr 12 19:16:51 2019 VERIFY OK: depth=0, C=RU, ST=MSK, L=Moscow, O=Vodny, OU=Tinkoff Bank, CN=server, name=server, emailAddress=unix-admins@tinkoff.ru
Fri Apr 12 19:16:51 2019 Data Channel Encrypt: Cipher 'AES-128-CBC' initialized with 128 bit key
Fri Apr 12 19:16:51 2019 Data Channel Encrypt: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 19:16:51 2019 Data Channel Decrypt: Cipher 'AES-128-CBC' initialized with 128 bit key
Fri Apr 12 19:16:51 2019 Data Channel Decrypt: Using 256 bit message hash 'SHA256' for HMAC authentication
Fri Apr 12 19:16:51 2019 Control Channel: TLSv1.2, cipher TLSv1/SSLv3 DHE-RSA-AES256-GCM-SHA384, 2048 bit RSA
Connection reset by 88.198.167.20
[s.belogrud@TCS4357]# ssh bsv@bk1.datamind.ru
Welcome to Ubuntu 12.04.3 LTS (GNU/Linux 3.8.0-33-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
New release '14.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Fri Apr 12 20:24:33 2019 from 91.194.227.252
bsv@bk1:~$ ssh s.belogrud@prod-hzeu-rtb-infra-ops-1.datamind.ru
Warning: Permanently added 'prod-hzeu-rtb-infra-ops-1.datamind.ru,148.251.6.45' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.15.0-30-generic x86_64)
     _       _                  _           _
  __| | __ _| |_ __ _ _ __ ___ (_)_ __   __| |  _ __ _   _
 / _` |/ _` | __/ _` | '_ ` _ \| | '_ \ / _` | | '__| | | |
| (_| | (_| | || (_| | | | | | | | | | | (_| |_| |  | |_| |
 \__,_|\__,_|\__\__,_|_| |_| |_|_|_| |_|\__,_(_)_|   \__,_|

Last login: Fri Apr 12 17:24:38 2019 from 88.198.167.20
s.belogrud@prod-hzeu-rtb-infra-ops-1:~$ sudo -i
root@prod-hzeu-rtb-infra-ops-1 ~ #

	................................................................................


Apr 15 08:54:09 prod-hzeu-rtb-infra-ops-1.datamind.ru systemd[1]: Created slice system-openvpn.slice.
-- Subject: Unit system-openvpn.slice has finished start-up
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- Unit system-openvpn.slice has finished starting up.
--
-- The start-up result is done.
Apr 15 08:54:09 prod-hzeu-rtb-infra-ops-1.datamind.ru systemd[1]: Starting OpenVPN connection to client1...
-- Subject: Unit openvpn@client1.service has begun start-up
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- Unit openvpn@client1.service has begun starting up.
Apr 15 08:54:09 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[8050]: Options error: In [CMD-LINE]:1: Error opening configuration file: /etc/openvpn/client1.conf
Apr 15 08:54:09 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[8050]: Use --help for more information.
Apr 15 08:54:09 prod-hzeu-rtb-infra-ops-1.datamind.ru systemd[1]: openvpn@client1.service: Control process exited, code=exited status=1
Apr 15 08:54:09 prod-hzeu-rtb-infra-ops-1.datamind.ru systemd[1]: Failed to start OpenVPN connection to client1.
-- Subject: Unit openvpn@client1.service has failed
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
--
-- Unit openvpn@client1.service has failed.

	 ................................................................................




root@prod-hzeu-rtb-infra-ops-1 ~ # ls -Alh /etc/openvpn/
total 20K
-rw-r----- 1 root root  13K Apr 12 17:53 client1.ovpn
-rwxr-xr-x 1 root root 1.3K Jun 20  2017 update-resolv-conf
root@prod-hzeu-rtb-infra-ops-1 ~ # cp /etc/openvpn/client1.{ovpn,conf}
root@prod-hzeu-rtb-infra-ops-1 ~ # ls -Alh /etc/openvpn/
total 36K
-rw-r----- 1 root root  13K Apr 15 09:02 client1.conf
-rw-r----- 1 root root  13K Apr 12 17:53 client1.ovpn
-rwxr-xr-x 1 root root 1.3K Jun 20  2017 update-resolv-conf
root@prod-hzeu-rtb-infra-ops-1 ~ #

root@prod-hzeu-rtb-infra-ops-1 ~ # systemctl status openvpn@client1
? openvpn@client1.service - OpenVPN connection to client1
   Loaded: loaded (/lib/systemd/system/openvpn@.service; disabled; vendor preset: enabled)
   Active: active (running) since Mon 2019-04-15 09:02:35 UTC; 15s ago
     Docs: man:openvpn(8)
           https://community.openvpn.net/openvpn/wiki/Openvpn23ManPage
           https://community.openvpn.net/openvpn/wiki/HOWTO
  Process: 13418 ExecStart=/usr/sbin/openvpn --daemon ovpn-%i --status /run/openvpn/%i.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/%i.conf --writepid /run/openvpn/%i.pid
 Main PID: 13419 (openvpn)
   CGroup: /system.slice/system-openvpn.slice/openvpn@client1.service
           L-13419 /usr/sbin/openvpn --daemon ovpn-client1 --status /run/openvpn/client1.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/client1.conf --writepid /run/openvpn

Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: TUN/TAP TX queue length set to 100
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: do_ifconfig, tt->did_ifconfig_ipv6_setup=0
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: /sbin/ip link set dev tun0 up mtu 1500
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: /sbin/ip addr add dev tun0 local 10.8.0.6 peer 10.8.0.5
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: /sbin/ip route add 10.218.9.86/32 via 10.8.0.5
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: /sbin/ip route add 10.8.0.1/32 via 10.8.0.5
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: GID set to nogroup
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: UID set to nobody
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: WARNING: this configuration may cache passwords in memory -- use the auth-nocache option to prevent this
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: Initialization Sequence Completed

root@prod-hzeu-rtb-infra-ops-1 ~ #


root@prod-hzeu-rtb-infra-ops-1 ~ # ping -c 3 vault-rnd.tcsbank.ru
PING vault-rnd.tcsbank.ru (10.218.9.86) 56(84) bytes of data.
64 bytes from vault-rnd.tcsbank.ru (10.218.9.86): icmp_seq=1 ttl=64 time=40.2 ms
64 bytes from vault-rnd.tcsbank.ru (10.218.9.86): icmp_seq=2 ttl=64 time=39.8 ms
64 bytes from vault-rnd.tcsbank.ru (10.218.9.86): icmp_seq=3 ttl=64 time=39.8 ms

--- vault-rnd.tcsbank.ru ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 39.803/39.970/40.251/0.199 ms
root@prod-hzeu-rtb-infra-ops-1 ~ # ssh bsv@vault-rnd.tcsbank.ru
bsv@vault-rnd.tcsbank.ru's password:
# Ansible managed

                                     | |  | |                            (_) |   | |
 _ __   _____      _____ _ __ ___  __| |  | |__  _   _     __ _ _ __  ___ _| |__ | | ___
| '_ \ / _ \ \ /\ / / _ \ '__/ _ \/ _` |  | '_ \| | | |   / _` | '_ \/ __| | '_ \| |/ _ \
| |_) | (_) \ V  V /  __/ | |  __/ (_| |  | |_) | |_| |  | (_| | | | \__ \ | |_) | |  __/
| .__/ \___/ \_/\_/ \___|_|  \___|\__,_|  |_.__/ \__, |   \__,_|_| |_|___/_|_.__/|_|\___|
| |                                               __/ |
|_|                                              |___/

                                    with cow supahpower

Welcome to "ds-advert-prod-vault-1.tcsbank.ru":
 - Server type........: "VMware"
 - Architecture.......: "x86_64"
 - CPU Cores..........: "2"
 - Memory.............: "3951" Mb
 - OS.................: "Ubuntu"
 - Release............: "16.04"
 - Kernel.............: "4.4.0-97-generic"
 - Addresses..........: "10.218.9.86"
 - Last provisioning..: "2018-12-17"

### TODO
#
# - Server role
# - Server apps
#
Last login: Mon Apr 15 11:49:51 2019 from 172.16.28.74
bsv@ds-advert-prod-vault-1:~$ logout
Connection to vault-rnd.tcsbank.ru closed.
root@prod-hzeu-rtb-infra-ops-1 ~ #


root@prod-hzeu-rtb-infra-ops-1 ~ # systemctl enable openvpn@client1
Created symlink from /etc/systemd/system/multi-user.target.wants/openvpn@client1.service to /lib/systemd/system/openvpn@.service.
root@prod-hzeu-rtb-infra-ops-1 ~ #

root@prod-hzeu-rtb-infra-ops-1 ~ # systemctl status openvpn@client1
? openvpn@client1.service - OpenVPN connection to client1
   Loaded: loaded (/lib/systemd/system/openvpn@.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2019-04-15 09:02:35 UTC; 3min 12s ago
     Docs: man:openvpn(8)
           https://community.openvpn.net/openvpn/wiki/Openvpn23ManPage
           https://community.openvpn.net/openvpn/wiki/HOWTO
 Main PID: 13419 (openvpn)
   CGroup: /system.slice/system-openvpn.slice/openvpn@client1.service
           L-13419 /usr/sbin/openvpn --daemon ovpn-client1 --status /run/openvpn/client1.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/client1.conf --writepid /run/openvpn

Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: TUN/TAP TX queue length set to 100
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: do_ifconfig, tt->did_ifconfig_ipv6_setup=0
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: /sbin/ip link set dev tun0 up mtu 1500
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: /sbin/ip addr add dev tun0 local 10.8.0.6 peer 10.8.0.5
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: /sbin/ip route add 10.218.9.86/32 via 10.8.0.5
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: /sbin/ip route add 10.8.0.1/32 via 10.8.0.5
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: GID set to nogroup
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: UID set to nobody
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: WARNING: this configuration may cache passwords in memory -- use the auth-nocache option to prevent this
Apr 15 09:02:36 prod-hzeu-rtb-infra-ops-1.datamind.ru ovpn-client1[13419]: Initialization Sequence Completed

root@prod-hzeu-rtb-infra-ops-1 ~ #


	 ................................................................................

root@ds-advert-prod-vault-1:~# cd client-configs/
root@ds-advert-prod-vault-1:~/client-configs# vim base.conf
root@ds-advert-prod-vault-1:~/client-configs# ./make_config.sh client2
cat: /root/openvpn-ca/keys/client2.crt: No such file or directory
cat: /root/openvpn-ca/keys/client2.key: No such file or directory
root@ds-advert-prod-vault-1:~/client-configs# cd ~/openvpn-ca/
root@ds-advert-prod-vault-1:~/openvpn-ca# source vars
NOTE: If you run ./clean-all, I will be doing a rm -rf on /root/openvpn-ca/keys
root@ds-advert-prod-vault-1:~/openvpn-ca# cd ~/client-configs/
root@ds-advert-prod-vault-1:~/client-configs# ./make_config.sh client2
cat: /root/openvpn-ca/keys/client2.crt: No such file or directory
cat: /root/openvpn-ca/keys/client2.key: No such file or directory
root@ds-advert-prod-vault-1:~/client-configs#


root@ds-advert-prod-vault-1:~/client-configs# cd ~/openvpn-ca/
root@ds-advert-prod-vault-1:~/openvpn-ca# source vars
NOTE: If you run ./clean-all, I will be doing a rm -rf on /root/openvpn-ca/keys
root@ds-advert-prod-vault-1:~/openvpn-ca# ./build-key client2
Generating a 2048 bit RSA private key
.....+++
......................................................................................+++
writing new private key to 'client2.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [RU]:
State or Province Name (full name) [MSK]:
Locality Name (eg, city) [Moscow]:
Organization Name (eg, company) [Vodny]:
Organizational Unit Name (eg, section) [Tinkoff Bank]:
Common Name (eg, your name or your server's hostname) [client2]:
Name [server]:
Email Address [unix-admins@tinkoff.ru]:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Using configuration from /root/openvpn-ca/openssl-1.0.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'RU'
stateOrProvinceName   :PRINTABLE:'MSK'
localityName          :PRINTABLE:'Moscow'
organizationName      :PRINTABLE:'Vodny'
organizationalUnitName:PRINTABLE:'Tinkoff Bank'
commonName            :PRINTABLE:'client2'
name                  :PRINTABLE:'server'
emailAddress          :IA5STRING:'unix-admins@tinkoff.ru'
Certificate is to be certified until Apr 12 13:12:08 2029 GMT (3650 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
root@ds-advert-prod-vault-1:~/openvpn-ca#

root@ds-advert-prod-vault-1:~/openvpn-ca# cd ~/client-configs/
root@ds-advert-prod-vault-1:~/client-configs# ./make_config.sh client2

root@ds-advert-prod-vault-1:~/client-configs# ls ~/client-configs/files/client2.ovpn
/root/client-configs/files/client2.ovpn
root@ds-advert-prod-vault-1:~/client-configs#



