

http://repo.datamind.ru/deb_all/

[2014-12-29 15:02.04]  ~
[s.belogrud.tcs4500] ➤ ssh bsv@bk1.datamind.ru
Permanently added 'bk1.datamind.ru' (ECDSA) to the list of known hosts.
bsv@bk1.datamind.ru's password:
Welcome to Ubuntu 12.04.3 LTS (GNU/Linux 3.8.0-33-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
New release '14.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

bsv@bk1:~$ sudo -i
[sudo] password for bsv:
root@bk1 ~ #


[2014-12-29 15:17.01]  /drives/d/share/distributives/zero/works/hadoop
[s.belogrud.tcs4500] ➤ scp /drives/d/share/temp/dspweb_1.1.2401_amd64.deb  bsv@dsp1.datamind.ru:/tmp/
dspweb_1.1.2401_amd64.deb                                                                                                                                    100%   93MB   2.5MB/s   00:37
                                                                                                                                                                                              ✔
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
[2014-12-29 15:19.03]  /drives/d/share/distributives/zero/works/hadoop
[s.belogrud.tcs4500] ➤ for var1 in {2..6} ; do scp /drives/d/share/temp/dspweb_1.1.2401_amd64.deb  bsv@dsp${var1}.datamind.ru:/tmp/ ; done
Permanently added 'dsp2.datamind.ru' (ECDSA) to the list of known hosts.
bsv@dsp2.datamind.ru's password:
bsv@dsp2.datamind.ru's password:
dspweb_1.1.2401_amd64.deb                                                                                                                                    100%   93MB   2.5MB/s   00:38
Permanently added 'dsp3.datamind.ru' (ECDSA) to the list of known hosts.
bsv@dsp3.datamind.ru's password:
dspweb_1.1.2401_amd64.deb                                                                                                                                    100%   93MB   2.3MB/s   00:40
Permanently added 'dsp4.datamind.ru' (ECDSA) to the list of known hosts.
bsv@dsp4.datamind.ru's password:
dspweb_1.1.2401_amd64.deb                                                                                                                                    100%   93MB   2.5MB/s   00:37
Permanently added 'dsp5.datamind.ru' (ECDSA) to the list of known hosts.
bsv@dsp5.datamind.ru's password:
dspweb_1.1.2401_amd64.deb                                                                                                                                    100%   93MB   2.5MB/s   00:37
Permanently added 'dsp6.datamind.ru' (ECDSA) to the list of known hosts.
bsv@dsp6.datamind.ru's password:
dspweb_1.1.2401_amd64.deb 


[s.belogrud.tcs4500] ➤ ssh bsv@dsp1.datamind.ru
Permanently added 'dsp1.datamind.ru' (ECDSA) to the list of known hosts.
bsv@dsp1.datamind.ru's password:
Welcome to Ubuntu 12.04.3 LTS (GNU/Linux 3.8.0-33-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
New release '14.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

bsv@dsp1:~$ sudo -i
[sudo] password for bsv:
root@dsp1 ~ #
root@dsp1 ~ #
root@dsp1 ~ # su - dsp
dsp@dsp1:~$ cd /usr/local/dspweb/
dsp@dsp1:~$ ./kill_all.sh
dsp@dsp1:~$ exit

root@dsp1 ~ # dpkg -i /tmp/dspweb_1.1.2401_amd64.deb
root@dsp1 ~ # su - dsp
dsp@dsp1:~$ cd /usr/local/dspweb/
dsp@dsp1:~$ sleep 60 && ./run_all.sh




