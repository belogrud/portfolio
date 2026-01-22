

[s.belogrud@TCS4357]# ssh bsv@api-test.tinkoffinsurance.ru
Password:
Last login: Mon Apr 16 12:13:31 2018 from 172.16.28.74
FreeBSD 9.1-RELEASE-p3 (GENERIC) #0: Mon Apr 29 18:27:25 UTC 2013

Welcome to FreeBSD!
...

#
#	Our default password must to be used.
#
[bsv@vm-gw-dmz-rproxy ~]$ su -
Password:
[root@vm-gw-dmz-rproxy ~]#

[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# uname -a
FreeBSD vm-gw-dmz-rproxy.tcsbank.ru 9.1-RELEASE-p3 FreeBSD 9.1-RELEASE-p3 #0: Mon Apr 29 18:27:25 UTC 2013     root@amd64-builder.daemonology.net:/usr/obj/usr/src/sys/GENERIC  amd64
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]#

...........................................................................


[root@vm-gw-dmz-rproxy ~]# ls -Alh /usr/local/etc/nginx/ssl_keys/
total 36
drwxrwx---  2 root  wheel   512B Jun 22  2016 api-dev_tinkoffinsurance_ru
drwxrwx---  2 root  wheel   512B Oct 23 14:19 api-test_tinkoffinsurance_ru
-rw-r--r--  1 root  wheel   1.7k Jan 27  2014 rpti-privatekey.key
-rw-r--r--  1 root  wheel   2.2k Jan 27  2014 rpti.crt
drwxr-xr-x  2 root  wheel   512B Jan 28  2014 tcs
-rw-r--r--  1 root  wheel   4.5k Jun  4  2013 tcsbank.crt
-rw-r--r--  1 root  wheel   1.7k Jun  4  2013 tcsbank.key
drwxr-xr-x  2 root  wheel   512B Oct 14  2016 tstrp
[root@vm-gw-dmz-rproxy ~]#

...........................................................................


[root@vm-gw-dmz-rproxy ~]# cd /usr/local/etc/nginx/
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# ls -Alh ssl_keys/api-test_tinkoffinsurance_ru/
total 28
-rwxr-x---  1 root  wheel   3.2k Jun 22  2016 api-test_tinkoffinsurance_ru.ca-bundle
-rwxr-x---  1 root  wheel   5.3k Oct 23 14:18 api-test_tinkoffinsurance_ru.crt
-rwxr-x---  1 root  wheel   5.2k Oct 23 12:57 api-test_tinkoffinsurance_ru.crt.bad
-rwxr-x---  1 root  wheel   2.1k Oct 23 11:38 api-test_tinkoffinsurance_ru.crt.orig
-rwxr-x---  1 root  wheel   1.7k Jun 22  2016 private.pem
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]#


[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# openssl x509 -in /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt -noout -issuer -subject -dates -hash -fingerprint
issuer= /C=US/O=thawte, Inc./OU=Domain Validated SSL/CN=thawte DV SSL CA - G2
subject= /CN=api-test.tinkoffinsurance.ru
notBefore=Jun 20 00:00:00 2016 GMT
notAfter=Jun 20 23:59:59 2018 GMT
77a7ad38
SHA1 Fingerprint=13:34:EB:DB:24:2E:CC:05:B3:D2:0A:2B:65:43:30:3D:75:1C:89:80


[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# openssl x509 -in /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.ca-bundle -noout -issuer -subject -dates -hash -fingerprint
issuer= /C=US/O=thawte, Inc./OU=Certification Services Division/OU=(c) 2006 thawte, Inc. - For authorized use only/CN=thawte Primary Root CA
subject= /C=US/O=thawte, Inc./OU=Domain Validated SSL/CN=thawte DV SSL CA - G2
notBefore=Jun 10 00:00:00 2014 GMT
notAfter=Jun  9 23:59:59 2024 GMT
661c52cc
SHA1 Fingerprint=4C:03:68:21:E4:34:13:B6:63:B0:6D:CF:01:4C:E9:0D:50:34:7F:99
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]#

...........................................................................

[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# grep -irle "api-test_tinkoffinsurance_ru.crt" /usr/local/etc/nginx/
/usr/local/etc/nginx/conf.d/sitecore-api.conf
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# grep -ire "api-test_tinkoffinsurance_ru.crt" /usr/local/etc/nginx/
/usr/local/etc/nginx/conf.d/sitecore-api.conf:    ssl_certificate             ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt;
/usr/local/etc/nginx/conf.d/sitecore-api.conf:    ssl_certificate             ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt;
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]#

[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# vim -R -c ":/api-test_tinkoffinsurance_ru.crt" /usr/local/etc/nginx/conf.d/sitecore-api.conf
# API Test
server {
    listen 192.168.5.227:38000 rcvbuf=32k sndbuf=32k accept_filter=httpready;

    ssl                         on;
    ssl_certificate             ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt;
    ssl_certificate_key         ssl_keys/api-test_tinkoffinsurance_ru/private.pem;
    ssl_session_timeout         5m;
    ssl_protocols               TLSv1.2;
    ssl_ciphers                 HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers   on;

    location / {
        proxy_pass              http://10.218.49.29:80;
        proxy_set_header        Host $http_host;
        proxy_set_header        X-Forwarded-For $remote_addr;
        proxy_set_header        X-Real-IP $remote_addr;
        proxy_redirect          default;
    }
}

# API Dev
server {
    listen 192.168.5.227:38001 rcvbuf=32k sndbuf=32k accept_filter=httpready;

    ssl                         on;
    ssl_certificate             ssl_keys/api-dev_tinkoffinsurance_ru/api-dev_tinkoffinsurance_ru.crt;
    ssl_certificate_key         ssl_keys/api-dev_tinkoffinsurance_ru/private.pem;
    ssl_session_timeout         5m;
    ssl_protocols               TLSv1;
    ssl_ciphers                 HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers   on;

    location / {
        proxy_pass              http://10.218.49.30:80;
        proxy_set_header        Host $http_host;
        proxy_set_header        X-Forwarded-For $remote_addr;
        proxy_set_header        X-Real-IP $remote_addr;
        proxy_redirect          default;
    }
}
...

#
#	I've added TLSv1 parameter into ssl_protocols.
#

# API Test
server {
    listen 192.168.5.227:38000 rcvbuf=32k sndbuf=32k accept_filter=httpready;

    ssl                         on;
    ssl_certificate             ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt;
    ssl_certificate_key         ssl_keys/api-test_tinkoffinsurance_ru/private.pem;
    ssl_session_timeout         5m;
    ssl_protocols               TLSv1 TLSv1.2;
    ssl_ciphers                 HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers   on;

    location / {
        proxy_pass              http://10.218.49.29:80;
        proxy_set_header        Host $http_host;
        proxy_set_header        X-Forwarded-For $remote_addr;
        proxy_set_header        X-Real-IP $remote_addr;
        proxy_redirect          default;
    }
}


[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# ifconfig
em0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
        options=9b<RXCSUM,TXCSUM,VLAN_MTU,VLAN_HWTAGGING,VLAN_HWCSUM>
        ether 00:50:56:93:4b:3c
        inet 192.168.5.227 netmask 0xffffff00 broadcast 192.168.5.255
        inet6 fe80::250:56ff:fe93:4b3c%em0 prefixlen 64 scopeid 0x1
        nd6 options=29<PERFORMNUD,IFDISABLED,AUTO_LINKLOCAL>
        media: Ethernet autoselect (1000baseT <full-duplex>)
        status: active
lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> metric 0 mtu 16384
        options=600003<RXCSUM,TXCSUM,RXCSUM_IPV6,TXCSUM_IPV6>
        inet6 ::1 prefixlen 128
        inet6 fe80::1%lo0 prefixlen 64 scopeid 0x2
        inet 127.0.0.1 netmask 0xff000000
        nd6 options=21<PERFORMNUD,AUTO_LINKLOCAL>
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]#

...........................................................................

[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# nginx -c /usr/local/etc/nginx/nginx.conf -t
nginx: the configuration file /usr/local/etc/nginx/nginx.conf syntax is ok
nginx: configuration file /usr/local/etc/nginx/nginx.conf test is successful
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# /usr/local/etc/rc.d/nginx restart
Performing sanity check on nginx configuration:
nginx: the configuration file /usr/local/etc/nginx/nginx.conf syntax is ok
nginx: configuration file /usr/local/etc/nginx/nginx.conf test is successful
Stopping nginx.
Waiting for PIDS: 646.
Performing sanity check on nginx configuration:
nginx: the configuration file /usr/local/etc/nginx/nginx.conf syntax is ok
nginx: configuration file /usr/local/etc/nginx/nginx.conf test is successful
Starting nginx.
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]#

...........................................................................

#
#	20180418
#

[s.belogrud@TCS4357]# scp /drives/c/Users/s.belogrud/Downloads/F5_api-test_tinkoffinsurance_ru.crt bsv@api-test.tinkoffinsurance.ru:/tmp/
Password:
F5_api-test_tinkoffinsurance_ru.crt                                                                                                                                           100% 5396     5.3KB/s   00:00
[s.belogrud@TCS4357]#

#
#	I've added option "TLSv1" for section, where listen 38002 port.
#
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]# egrep -e "listen|ssl_protocols" /usr/local/etc/nginx/conf.d/sitecore-api.conf
    listen 192.168.5.227:38000 rcvbuf=32k sndbuf=32k accept_filter=httpready;
    ssl_protocols               TLSv1 TLSv1.2;
    listen 192.168.5.227:38001 rcvbuf=32k sndbuf=32k accept_filter=httpready;
    ssl_protocols               TLSv1;
    listen 192.168.5.227:38002 rcvbuf=32k sndbuf=32k accept_filter=httpready;
    ssl_protocols               TLSv1 TLSv1.2;
    listen 192.168.5.227:38011 rcvbuf=32k sndbuf=32k accept_filter=httpready;
    ssl_protocols               TLSv1.2;
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]#

................................................................................

[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]# openssl x509 -in /tmp/F5_api-test_tinkoffinsurance_ru.crt -noout -issuer -subject -dates -hash -fingerprint
issuer= /C=US/O=thawte, Inc./OU=Domain Validated SSL/CN=thawte DV SSL CA - G2
subject= /CN=api-test.tinkoffinsurance.ru
notBefore=Jun 20 00:00:00 2016 GMT
notAfter=Jun 20 23:59:59 2018 GMT
77a7ad38
SHA1 Fingerprint=13:34:EB:DB:24:2E:CC:05:B3:D2:0A:2B:65:43:30:3D:75:1C:89:80
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]#
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]#
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]# openssl x509 -in /tmp/F5_api-test_tinkoffinsurance_ru.crt -text
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            6e:93:da:0b:69:08:a1:03:2c:15:0c:28:5c:a4:30:f2
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=US, O=thawte, Inc., OU=Domain Validated SSL, CN=thawte DV SSL CA - G2
        Validity
            Not Before: Jun 20 00:00:00 2016 GMT
            Not After : Jun 20 23:59:59 2018 GMT
        Subject: CN=api-test.tinkoffinsurance.ru
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:bc:ff:ec:a3:aa:4f:84:a4:07:cd:03:54:4d:be:
                    da:1f:40:52:9a:3d:8e:f6:e1:c9:4a:cc:43:c7:04:
                    12:54:a0:40:11:85:b2:2c:fe:85:4d:83:4f:8b:4e:
                    1f:9c:ca:8b:5f:de:e9:db:c8:30:b6:28:e1:26:bd:
                    42:5f:ca:3d:2e:ac:8a:9d:9f:53:78:96:0d:f9:12:
                    da:e4:78:23:9c:bc:6c:82:85:a5:6d:91:e6:aa:bb:
                    69:f6:3f:3c:c9:90:35:55:6d:21:7e:61:db:19:ad:
                    e4:52:c8:9b:2d:84:d2:e9:50:e1:cb:7d:e8:dd:39:
                    85:7e:2d:56:81:7a:c4:f6:c6:10:7f:00:c6:ce:b4:
                    2c:18:11:4b:24:84:64:04:25:b8:d9:3d:bc:87:b2:
                    c0:38:db:56:e8:62:6a:19:e6:41:33:f7:67:eb:a7:
                    95:e0:f7:34:64:5d:92:28:06:ef:1c:7d:18:9a:d9:
                    79:a8:2f:33:1e:05:08:ca:20:3b:3a:44:b0:ed:62:
                    c4:ad:4d:e8:1c:67:91:44:95:46:cf:6e:a7:9e:c7:
                    2e:06:01:b3:ca:2f:59:6f:fd:72:8e:60:31:fb:bf:
                    fe:34:de:4e:5b:ba:9d:dc:3a:fd:b3:0e:be:f4:50:
                    4b:95:9a:ed:be:fd:f3:e0:83:6e:7a:72:ff:1c:ab:
                    51:eb
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Alternative Name:
                DNS:api-test.tinkoffinsurance.ru
            X509v3 Basic Constraints:
                CA:FALSE
            X509v3 CRL Distribution Points:

                Full Name:
                  URI:http://tn.symcb.com/tn.crl

            X509v3 Certificate Policies:
                Policy: 2.23.140.1.2.1
                  CPS: https://www.thawte.com/cps
                  User Notice:
                    Explicit Text: https://www.thawte.com/repository

            X509v3 Authority Key Identifier:
                keyid:9F:B8:C1:A9:6C:F2:F5:C0:22:2A:94:ED:5C:99:AC:D4:EC:D7:C6:07

            X509v3 Key Usage: critical
                Digital Signature, Key Encipherment
            X509v3 Extended Key Usage:
                TLS Web Server Authentication, TLS Web Client Authentication
            Authority Information Access:
                OCSP - URI:http://tn.symcd.com
                CA Issuers - URI:http://tn.symcb.com/tn.crt

            1.3.6.1.4.1.11129.2.4.2:
..\.......... _.............).....9lF|H..@.....v.......X......gp
.....Um.d......G0E. -.M......DBPC..}...LZv.*X...._...!....2$...#.}yK.Lo....Z.T23'./..A..w.h....d..:...(.L.qQ]g..D.
}laOO.....Um.d......H0F.!.....C...c...K~......"..R..Q....T.!.....-z.._..wZ[..@.}...f..*'>
    Signature Algorithm: sha256WithRSAEncryption
         c7:c6:4a:b7:53:84:29:23:1a:72:25:51:f1:63:00:bc:8a:0a:
         b2:f0:62:6f:88:32:db:5c:3b:a5:01:c7:bd:cb:a2:3a:65:94:
         d1:66:3f:1f:83:3e:4c:ce:2f:42:4e:9b:82:9d:8b:5c:da:c1:
         cc:4d:68:03:e0:e7:38:e9:19:bd:af:28:e7:b5:d8:24:37:a9:
         c8:05:27:33:2b:e9:1a:0b:a8:1d:79:be:c0:d4:a2:6b:cb:27:
         7f:1e:56:2e:8c:54:9c:1b:25:85:be:f5:30:a2:6d:6f:e2:58:
         30:76:6b:a3:5e:c8:c2:45:2d:38:5a:cc:6b:e9:b3:20:84:ea:
         ca:cd:33:81:97:a3:5a:17:71:80:04:9a:38:56:6f:b7:16:fa:
         36:95:f6:e2:c3:20:77:1b:64:48:8f:63:ad:a4:78:80:cd:91:
         8a:83:8d:4f:97:5c:1e:ae:92:3b:da:1b:76:96:ac:6b:47:83:
         db:47:23:31:4b:d7:c9:67:cf:eb:aa:39:4f:ff:22:50:b3:1f:
         aa:23:1c:fb:b4:a6:d4:d5:b0:67:78:c0:6b:05:31:6b:db:4e:
         76:e4:50:8c:f8:63:c8:ac:a1:17:e5:49:6e:84:bb:fe:d2:01:
         bd:5f:01:0f:d7:4b:65:53:8f:ed:c2:f1:a2:cb:11:81:bc:4b:
         01:6a:4e:45
-----BEGIN CERTIFICATE-----
MIIGFzCCBP+gAwIBAgIQbpPaC2kIoQMsFQwoXKQw8jANBgkqhkiG9w0BAQsFADBj
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMdGhhd3RlLCBJbmMuMR0wGwYDVQQLExRE
b21haW4gVmFsaWRhdGVkIFNTTDEeMBwGA1UEAxMVdGhhd3RlIERWIFNTTCBDQSAt
IEcyMB4XDTE2MDYyMDAwMDAwMFoXDTE4MDYyMDIzNTk1OVowJzElMCMGA1UEAwwc
YXBpLXRlc3QudGlua29mZmluc3VyYW5jZS5ydTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBALz/7KOqT4SkB80DVE2+2h9AUpo9jvbhyUrMQ8cEElSgQBGF
siz+hU2DT4tOH5zKi1/e6dvIMLYo4Sa9Ql/KPS6sip2fU3iWDfkS2uR4I5y8bIKF
pW2R5qq7afY/PMmQNVVtIX5h2xmt5FLImy2E0ulQ4ct96N05hX4tVoF6xPbGEH8A
xs60LBgRSySEZAQluNk9vIeywDjbVuhiahnmQTP3Z+unleD3NGRdkigG7xx9GJrZ
eagvMx4FCMogOzpEsO1ixK1N6BxnkUSVRs9up57HLgYBs8ovWW/9co5gMfu//jTe
Tlu6ndw6/bMOvvRQS5Wa7b798+CDbnpy/xyrUesCAwEAAaOCAwEwggL9MCcGA1Ud
EQQgMB6CHGFwaS10ZXN0LnRpbmtvZmZpbnN1cmFuY2UucnUwCQYDVR0TBAIwADAr
BgNVHR8EJDAiMCCgHqAchhpodHRwOi8vdG4uc3ltY2IuY29tL3RuLmNybDBuBgNV
HSAEZzBlMGMGBmeBDAECATBZMCYGCCsGAQUFBwIBFhpodHRwczovL3d3dy50aGF3
dGUuY29tL2NwczAvBggrBgEFBQcCAjAjDCFodHRwczovL3d3dy50aGF3dGUuY29t
L3JlcG9zaXRvcnkwHwYDVR0jBBgwFoAUn7jBqWzy9cAiKpTtXJms1OzXxgcwDgYD
VR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjBXBggr
BgEFBQcBAQRLMEkwHwYIKwYBBQUHMAGGE2h0dHA6Ly90bi5zeW1jZC5jb20wJgYI
KwYBBQUHMAKGGmh0dHA6Ly90bi5zeW1jYi5jb20vdG4uY3J0MIIBfwYKKwYBBAHW
eQIEAgSCAW8EggFrAWkAdgDd6x0reg1PpiCLga2BaHB+Lo6dAdVciI09EcTNtuy+
zAAAAVVt62TAAAAEAwBHMEUCIQDGWZ5rp1vb8vZSNiDucoQGfZZYDceEXIguo+OV
1gCitQIgX9OLrf2CB4US95aEn/UpjNYP3Zw5bEZ8SLe7QB+B7voAdgCkuQmQtBhY
FIe7E6LMZ3AKPDWYBPkb37jjd80OyA3cEAAAAVVt62TpAAAEAwBHMEUCIC26TbMG
2h6CsERCUEPjnX0EEqFMWnaTKlgT3aGgX9q8AiEAlcMeMiTL7Kkj5315S6NMb6rm
nYZa8FQyMyenL4DzQR8AdwBo9pj4H2SCvjqM7rkoHUz8cVFdZ5PURNEKZ6y7T0/7
xAAAAVVt62TlAAAEAwBIMEYCIQC2BLHKQ4qQ8WPNzqlLfp+S2MrZDiKC21K/uVHn
9fDSVAIhAOqVzq8teg6LX83Vd1pb2LdAGn0GFd5mne0qJz4NfWxhMA0GCSqGSIb3
DQEBCwUAA4IBAQDHxkq3U4QpIxpyJVHxYwC8igqy8GJviDLbXDulAce9y6I6ZZTR
Zj8fgz5Mzi9CTpuCnYtc2sHMTWgD4Oc46Rm9ryjntdgkN6nIBSczK+kaC6gdeb7A
1KJryyd/HlYujFScGyWFvvUwom1v4lgwdmujXsjCRS04Wsxr6bMghOrKzTOBl6Na
F3GABJo4Vm+3Fvo2lfbiwyB3G2RIj2OtpHiAzZGKg41Pl1werpI72ht2lqxrR4Pb
RyMxS9fJZ8/rqjlP/yJQsx+qIxz7tKbU1bBneMBrBTFr20525FCM+GPIrKEX5Ulu
hLv+0gG9XwEP10tlU4/twvGiyxGBvEsBak5F
-----END CERTIFICATE-----
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]#

................................................................................



Привет


Сергей Белогруд [6:38 PM]
Да, привет.

Сергей Белогруд [6:41 PM]
added and commented on this Plain Text snippet: Untitled 
Было так:
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# vim -R -c ":/api-test_tinkoffinsurance_ru.crt" /usr/local/etc/nginx/conf.d/sitecore-api.conf
# API Test
server {
  listen 192.168.5.227:38000 rcvbuf=32k sndbuf=32k accept_filter=httpready;
  ssl             on;
  ssl_certificate       ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt;
  ssl_certificate_key     ssl_keys/api-test_tinkoffinsurance_ru/private.pem;
  ssl_session_timeout     5m;
  ssl_protocols        TLSv1.2;
  ssl_ciphers         HIGH:!aNULL:!MD5;
  ssl_prefer_server_ciphers  on;
  location / {
    proxy_pass       http://10.218.49.29:80;
    proxy_set_header    Host $http_host;
    proxy_set_header    X-Forwarded-For $remote_addr;
    proxy_set_header    X-Real-IP $remote_addr;
    proxy_redirect     default;
  }
}
...
Стало так:
# API Test
server {
  listen 192.168.5.227:38000 rcvbuf=32k sndbuf=32k accept_filter=httpready;
  ssl             on;
  ssl_certificate       ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt;
  ssl_certificate_key     ssl_keys/api-test_tinkoffinsurance_ru/private.pem;
  ssl_session_timeout     5m;
  ssl_protocols        TLSv1 TLSv1.2;
  ssl_ciphers         HIGH:!aNULL:!MD5;
  ssl_prefer_server_ciphers  on;
  location / {
    proxy_pass       http://10.218.49.29:80;
    proxy_set_header    Host $http_host;
    proxy_set_header    X-Forwarded-For $remote_addr;
    proxy_set_header    X-Real-IP $remote_addr;
    proxy_redirect     default;
  }
}
Collapse 
Для информации. Изменилась строчка:
ssl_protocols               TLSv1 TLSv1.2;

Евгений Ерофеев [6:41 PM]
10 минут

Сергей Белогруд [6:41 PM]
Можно и больше. :slightly_smiling_face:

Евгений Ерофеев [7:27 PM]
я тут)
api-test.tinkoffinsurance.ru
ты только с этим хостом можешь работать?
если да, тогда отлично, на хосте api-test.tinkoffinsurance.ru:
1) нужно включить TLSv1.0 (если я правильно понял, ты уже сделал)
2) подставить новую или исправить старую цепочку сертификатов (скорее всего тебе нужно к безопасникам), которая будет работать на всех android устройствах. (edited)

Евгений Ерофеев [9:33 AM]
Привет
```Тема с TLS 1.0 пока отложена. Это третья внезапно образовавшаяся сопутствующая тема. В этой же теме фирурирует нечто, называемое api-dev.tinkoffinsurance.ru. Возмоно что-то по этой задаче уже решено. Автор заявки проверит и далее станет понятнее что, как, куда и зачем.```
Мобильное приложение взаимодействует с 2 хостами API страховой и для удобства используем сокращения:
a) api-test.tinkoffinsurance.ru -> dev или test сервер
b) api.tinkoffinsurance.ru -> prod сервер
Я не знаю откуда взялся хост api-dev.tinkoffinsurance.ru, мы с ним не работаем. (edited)

Сергей Белогруд [11:03 AM]
uploaded and commented on this image: image.png 

В настоящий момент задача на безопасниках. Для ускорения её продвижения можно контактировать непосредственно с ними.

Сергей Белогруд [11:08 AM]
Спасибо за разъяснения. Надеюсь всё получится.
Толковые комментарии существенно облегчают разбор чужого кода и деталей заявки, внезапно, тоже. Своевременные комментарии даже ещё лучше. :slightly_smiling_face:

Евгений Ерофеев [11:10 AM]
:+1:

Сергей Белогруд [11:18 AM]
Переговорил вчера с Сакалкиным Владиславом (это сетевик - net-admins) - он усно всё подтвердил по установке "правильного" сертификата для api.tinkoffinsurance.ru. То есть безопасники дадут ему "правильный" сертификат (видимо даже сборку из сертификатов, включая корневой) и он заменит старые. Тогда можно будет сразу же и проверить, как ваш софт заработает с api.tinkoffinsurance.ru - в том смысле правильно безопасники сделали bundle из сертификатов или не очень.

Евгений Ерофеев [11:27 AM]
круто, спасибо!
сколько времени это примерно может занять?

Сергей Белогруд [11:28 AM]
Предлагаю спросить это у безопасников и сетевиков.

................................................................................


Сергей Белогруд [4:35 PM]
uploaded and commented on this image: image.png 

Новый сертификат для api-test.tinkoffinsurance.ru прибыл.
Заменяю?

Сергей Белогруд [4:44 PM]
Обратите внимание, что срок действия сертификата заканчивается 21.06.2018. То есть относительно скоро.
Андрей Курицын сообщил, что в текущий момент выпустить сертификат на более длительный срок не сможет.


Евгений Ерофеев [4:45 PM]
давай проверим эту цепочку сертификатов
ты включил tsl 1.0 ?

Сергей Белогруд [4:46 PM]
Со времени переписки ничего не трогал.
Надеюсь, что оно включилось.

Евгений Ерофеев [4:46 PM]
сек, сейчас проверим
```nmap -sV --script ssl-enum-ciphers -p 38002 api-test.tinkoffinsurance.ru
Starting Nmap 7.70 ( https://nmap.org ) at 2018-04-18 16:46 MSK
Nmap scan report for api-test.tinkoffinsurance.ru (192.168.5.227)
Host is up (0.0020s latency).

PORT      STATE SERVICE  VERSION
38002/tcp open  ssl/http nginx
|_http-server-header: MSX Turbo R (R800) Web Server 0.46
|_http-trane-info: Problem with XML parsing of /evox/about
| ssl-enum-ciphers: 
|   TLSv1.2: 
|     ciphers: 
|       TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (secp256r1) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (secp256r1) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (secp256r1) - A
|       TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (dh 1024) - A
|       TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (dh 1024) - A
|       TLS_DHE_RSA_WITH_AES_256_CBC_SHA (dh 1024) - A
|       TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA (dh 1024) - A
|       TLS_RSA_WITH_AES_256_GCM_SHA384 (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_CAMELLIA_256_CBC_SHA (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA (secp256r1) - C
|       TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA (dh 1024) - D
|       TLS_RSA_WITH_3DES_EDE_CBC_SHA (rsa 2048) - C
|       TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (secp256r1) - A
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (secp256r1) - A
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (secp256r1) - A
|       TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (dh 1024) - A
|       TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (dh 1024) - A
|       TLS_DHE_RSA_WITH_AES_128_CBC_SHA (dh 1024) - A
|       TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA (dh 1024) - A
|       TLS_RSA_WITH_AES_128_GCM_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_CAMELLIA_128_CBC_SHA (rsa 2048) - A
|     compressors: 
|       NULL
|     cipher preference: server
|     warnings: 
|       64-bit block cipher 3DES vulnerable to SWEET32 attack
|       Key exchange (dh 1024) of lower strength than certificate key
|_  least strength: D```


нету
для того чтобы проверить сертификаты, нужна поддержка 1.0

Сергей Белогруд [4:47 PM]
Я ещё новый сертификат не поставил... Так-то.
Мммм.

Евгений Ерофеев [4:48 PM]
перед проверкой нужно включить 1.0 :smiley:

Сергей Белогруд [4:48 PM]
Тогда, видимо, что-то где-то ещё нужно куда-то вписать....
Есть где-то место, где TLS1.0 включен?
На этом же сервере.

Евгений Ерофеев [4:49 PM]
ты же выше кидал:
```ssl_protocols               TLSv1 TLSv1.2;```
ты обратно откатил?

Сергей Белогруд [4:49 PM]
Нет. Всё, как я сделал.

Евгений Ерофеев [4:49 PM]
38002 api-test.tinkoffinsurance.ru
это точно тот же хост?
~так ты не туда добавил)~ (edited)
~а не~ (edited)
да, я думаю должно заработать

Сергей Белогруд [4:51 PM]
В секцию, где 38002 я не добавлял.
Сейчас добавлю.

Евгений Ерофеев [4:51 PM]
почему не работает, я не знаю, я не админ)

Сергей Белогруд [4:52 PM]
uploaded and commented on this image: image.png 

Вот с этой секцией работал.

Евгений Ерофеев [4:52 PM]
сек
buildConfigField “String”, “TINKOFF_INSURANCE_HOST”, “\”api-test.tinkoffinsurance.ru\“”
           buildConfigField “int”, “TINKOFF_INSURANCE_PORT”, “38002”
мы работаем с 38002

Сергей Белогруд [4:54 PM]
Проверь ещё разок.

Евгений Ерофеев [4:55 PM]
```nmap -sV --script ssl-enum-ciphers -p 38002 api-test.tinkoffinsurance.ru
Starting Nmap 7.70 ( https://nmap.org ) at 2018-04-18 16:54 MSK
Nmap scan report for api-test.tinkoffinsurance.ru (192.168.5.227)
Host is up (0.0021s latency).

PORT      STATE SERVICE  VERSION
38002/tcp open  ssl/http nginx
|_http-server-header: MSX Turbo R (R800) Web Server 0.46
|_http-trane-info: Problem with XML parsing of /evox/about
| ssl-enum-ciphers: 
|   TLSv1.0: 
|     ciphers: 
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (secp256r1) - A
|       TLS_DHE_RSA_WITH_AES_256_CBC_SHA (dh 1024) - A
|       TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA (dh 1024) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_CAMELLIA_256_CBC_SHA (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA (secp256r1) - C
|       TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA (dh 1024) - D
|       TLS_RSA_WITH_3DES_EDE_CBC_SHA (rsa 2048) - C
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (secp256r1) - A
|       TLS_DHE_RSA_WITH_AES_128_CBC_SHA (dh 1024) - A
|       TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA (dh 1024) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_CAMELLIA_128_CBC_SHA (rsa 2048) - A
|     compressors: 
|       NULL
|     cipher preference: server
|     warnings: 
|       64-bit block cipher 3DES vulnerable to SWEET32 attack
|       Key exchange (dh 1024) of lower strength than certificate key
|   TLSv1.2: 
|     ciphers: 
|       TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (secp256r1) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (secp256r1) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (secp256r1) - A
|       TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (dh 1024) - A
|       TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 (dh 1024) - A
|       TLS_DHE_RSA_WITH_AES_256_CBC_SHA (dh 1024) - A
|       TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA (dh 1024) - A
|       TLS_RSA_WITH_AES_256_GCM_SHA384 (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_CAMELLIA_256_CBC_SHA (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA (secp256r1) - C
|       TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA (dh 1024) - D
|       TLS_RSA_WITH_3DES_EDE_CBC_SHA (rsa 2048) - C
|       TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (secp256r1) - A
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (secp256r1) - A
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (secp256r1) - A
|       TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (dh 1024) - A
|       TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 (dh 1024) - A
|       TLS_DHE_RSA_WITH_AES_128_CBC_SHA (dh 1024) - A
|       TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA (dh 1024) - A
|       TLS_RSA_WITH_AES_128_GCM_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_CAMELLIA_128_CBC_SHA (rsa 2048) - A
|     compressors: 
|       NULL
|     cipher preference: server
|     warnings: 
|       64-bit block cipher 3DES vulnerable to SWEET32 attack
|       Key exchange (dh 1024) of lower strength than certificate key
|_  least strength: D```
(edited)
да отлично, сейчас проверю

Сергей Белогруд [4:55 PM]
Тоесть заработало?

Евгений Ерофеев [4:55 PM]
сертификаты поменял?

Сергей Белогруд [4:55 PM]
Нет ещё.

Сергей Белогруд [4:56 PM]
added this Plain Text snippet: Untitled 
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]# egrep -e "listen|ssl_protocols" /usr/local/etc/nginx/conf.d/sitecore-api.conf
  listen 192.168.5.227:38000 rcvbuf=32k sndbuf=32k accept_filter=httpready;
  ssl_protocols        TLSv1 TLSv1.2;
  listen 192.168.5.227:38001 rcvbuf=32k sndbuf=32k accept_filter=httpready;
  ssl_protocols        TLSv1;
  listen 192.168.5.227:38002 rcvbuf=32k sndbuf=32k accept_filter=httpready;
  ssl_protocols        TLSv1 TLSv1.2;
  listen 192.168.5.227:38011 rcvbuf=32k sndbuf=32k accept_filter=httpready;
  ssl_protocols        TLSv1.2;
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]#
Collapse 

Сергей Белогруд [4:56 PM]
Такие на текущий момент настройки по SSL.
Меняю сертификат.

Евгений Ерофеев [4:57 PM]
сек
погоди

Сергей Белогруд [4:57 PM]
Жду.

Евгений Ерофеев [4:59 PM]
опа
сейчас все ок работает с как понимю с тем же сертификатом
погоди проверю прод

Сергей Белогруд [5:00 PM]
Я пока сертификат на новый не менял. Жду твоей команды.

Евгений Ерофеев [5:00 PM]
хорошо

Сергей Белогруд [5:00 PM]
На проде нужно с Сакалкиным, например, связываться. Ему Курицын тоже новый сертификат сделал и выслал.

Евгений Ерофеев [5:01 PM]
хорошо
сек
macmini-eerofeev2:~ e.erofeev2$ openssl s_client -connect api-test.tinkoffinsurance.ru:38002
CONNECTED(00000003)
depth=2 /C=US/O=thawte, Inc./OU=Certification Services Division/OU=(c) 2006 thawte, Inc. - For authorized use only/CN=thawte Primary Root CA
verify error:num=19:self signed certificate in certificate chain
verify return:0
---
Certificate chain
0 s:/CN=api-test.tinkoffinsurance.ru
  i:/C=US/O=thawte, Inc./OU=Domain Validated SSL/CN=thawte DV SSL CA - G2
1 s:/C=US/O=thawte, Inc./OU=Domain Validated SSL/CN=thawte DV SSL CA - G2
  i:/C=US/O=thawte, Inc./OU=Certification Services Division/OU=(c) 2006 thawte, Inc. - For authorized use only/CN=thawte Primary Root CA
2 s:/C=US/O=thawte, Inc./OU=Certification Services Division/OU=(c) 2006 thawte, Inc. - For authorized use only/CN=thawte Primary Root CA
  i:/C=US/O=thawte, Inc./OU=Certification Services Division/OU=(c) 2006 thawte, Inc. - For authorized use only/CN=thawte Primary Root CA
кто то уже вроде поменял сертификаты
почему?

Сергей Белогруд [5:06 PM]
added and commented on this Plain Text snippet: Untitled 
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]# ls -alh
total 44
drwxrwx--- 2 root wheel  512B Apr 18 16:41 .
drwxr-xr-x 6 root wheel  512B Jun 22 2016 ..
-rwxr-x--- 1 root wheel  3.2k Jun 22 2016 api-test_tinkoffinsurance_ru.ca-bundle
-rwxr-x--- 1 root wheel  5.3k Oct 23 14:18 api-test_tinkoffinsurance_ru.crt
-rwxr-x--- 1 root wheel  5.3k Apr 18 16:41 api-test_tinkoffinsurance_ru.crt.backup.20180418
-rwxr-x--- 1 root wheel  5.2k Oct 23 12:57 api-test_tinkoffinsurance_ru.crt.bad
-rwxr-x--- 1 root wheel  2.1k Oct 23 11:38 api-test_tinkoffinsurance_ru.crt.orig
-rwxr-x--- 1 root wheel  1.7k Jun 22 2016 private.pem
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]#
Collapse 
Это не подтверждается с моей стороны. У файла api-test_tinkoffinsurance_ru.crt дата модификации Октябрь 23го.
Для сравнения - я сделал его резервную копию api-test_tinkoffinsurance_ru.crt.backup.20180418 - дата модификации сегодняшняя.

Сергей Белогруд [5:09 PM]
added this Plain Text snippet: Untitled 
Так же fingerprint у файла одинаковый.
Этот я снимал несколько дней назад, когда начинал заниматься заявкой.
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx]# openssl x509 -in /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt -noout -issuer -subject -dates -hash -fingerprint
issuer= /C=US/O=thawte, Inc./OU=Domain Validated SSL/CN=thawte DV SSL CA - G2
subject= /CN=api-test.tinkoffinsurance.ru
notBefore=Jun 20 00:00:00 2016 GMT
notAfter=Jun 20 23:59:59 2018 GMT
77a7ad38
SHA1 Fingerprint=13:34:EB:DB:24:2E:CC:05:B3:D2:0A:2B:65:43:30:3D:75:1C:89:8
А этот только что.
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]# openssl x509 -in /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru/api-test_tinkoffinsurance_ru.crt -noout -issuer -subject -dates -hash -fingerprint
issuer= /C=US/O=thawte, Inc./OU=Domain Validated SSL/CN=thawte DV SSL CA - G2
subject= /CN=api-test.tinkoffinsurance.ru
notBefore=Jun 20 00:00:00 2016 GMT
notAfter=Jun 20 23:59:59 2018 GMT
77a7ad38
SHA1 Fingerprint=13:34:EB:DB:24:2E:CC:05:B3:D2:0A:2B:65:43:30:3D:75:1C:89:80
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]#
Collapse 

Евгений Ерофеев [5:10 PM]
погоди пару минут
сейчас точно скажу что и как
могу сказать что точно заработало
без сертификата

Сергей Белогруд [5:13 PM]
added and commented on this Plain Text snippet: Untitled 
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]# openssl x509 -in /tmp/F5_api-test_tinkoffinsurance_ru.crt -noout -issuer -subject -dates -hash -fingerprint         issuer= /C=US/O=thawte, Inc./OU=Domain Validated SSL/CN=thawte DV SSL CA - G2
subject= /CN=api-test.tinkoffinsurance.ru
notBefore=Jun 20 00:00:00 2016 GMT
notAfter=Jun 20 23:59:59 2018 GMT
77a7ad38
SHA1 Fingerprint=13:34:EB:DB:24:2E:CC:05:B3:D2:0A:2B:65:43:30:3D:75:1C:89:80
[root@vm-gw-dmz-rproxy /usr/local/etc/nginx/ssl_keys/api-test_tinkoffinsurance_ru]#
Collapse 
Хотя похоже fingerprint не показатель. Это, например, для нового файла сертификата. И он выглядит точно так же, как и для старого сертификата...

Евгений Ерофеев [5:13 PM]
просто я помню почему то, что и на дев и на прод цепочку была одинакова
найти не могу =(
скрины делал экрана
короче, на деве менять сертификат не надо
он проверяется на наших устройствах

Сергей Белогруд [5:19 PM]
Что ж - ладно. Не буду тогда.

Евгений Ерофеев [5:19 PM]
теперь надо решить вопрос с продом

Сергей Белогруд [5:20 PM]
Свяжись с Сакалкиным Владиславом - что он скажет. Может он уже поменял?

Евгений Ерофеев [5:20 PM]
не знаю, но заработало, уже отлично)
мб я ошибся и показалось
хорошо, я ему напишу

................................................................................





