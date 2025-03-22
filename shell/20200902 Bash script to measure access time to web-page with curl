#
#	20200902
#	In this document placed my experience, how to get time to access to web-page “20200827 Find where is slow connection to the Internet from server  vm-cashoff01p”.
#	Here are some examples from that experience.

#	Here creates output file named as Help.htm
root@vm-cashoff01p:~# curl --trace-time --trace-ascii curl.trace.log -x http://10.219.80.150:3128 -O -k  https://link.alfabank.ru/webclient/pages/static/iFrames/Help.htm
>curl.log 2>curl.err.log

# Here is no output file.
root@vm-cashoff01p:~# curl --trace-time --trace-ascii curl.trace.log -x http://10.219.80.150:3128 -o /dev/null -k  https://link.alfabank.ru/webclient/pages/static/iFrames/Help.htm 2>curl.err.log

# Here creates three output file: curl.log - it's same as Help.htm, curl.trace.log, curl.err.log.
root@vm-cashoff01p:~# curl --trace-time --trace-ascii curl.trace.log -x http://10.219.80.150:3128 -k  https://link.alfabank.ru/webclient/pages/static/iFrames/Help.htm 2>curl.err.log

root@vm-cashoff01p:~# curl -s -S -x http://10.219.80.150:3128 -o /dev/null -k https://link.alfabank.ru/webclient/pages/static/iFrames/Help.htm -w "%{time_total},%{size_download},%{speed_download}\n" >> curl.stats.log
root@vm-cashoff01p:~# cat curl.stats.log
1.373,3091,2251.000
root@vm-cashoff01p:~#


root@vm-cashoff01p:~# time curl -x http://10.219.80.150:3128 -o /dev/null -k https://link.alfabank.ru/webclient/pages/static/iFrames/Help.htm -w "time_total=%{time_total}, size_download=%{size_download}, speed_download=%{speed_download}\n"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  3091    0  3091    0     0   2288      0 --:--:--  0:00:01 --:--:--  2287
time_total=1.350, size_download=3091, speed_download=2288.000

real    0m1.368s
user    0m0.112s
sys     0m0.024s
root@vm-cashoff01p:~#


root@vm-cashoff01p:~# cat ~bsv/work/test.and.log.connection.speed.sh
#!/bin/bash

file_summary_statistics="/tmp/$(date +%Y%m%d-xxxx).test.connection.speed.txt"
curl_trace_log="/tmp/curl.trace.log"
curl_statistic_log="/tmp/curl.statistic.log"
curl_progress_log="/tmp/curl.progress.log"

timeout 3m curl --trace-time --trace-ascii ${curl_trace_log} -x http://10.219.80.150:3128 -o /dev/null -k https://link.alfabank.ru/webclient/pages/static/iFrames/Help.htm -w "time_total=%{time_total}, size_download=%{size_download}, speed_download=%{speed_download}\n" >${curl_statistic_log} 2>${curl_progress_log}

echo "#### $(date) ####" >> ${file_summary_statistics}

echo -e "\n" >> ${file_summary_statistics}
cat ${curl_statistic_log} >> ${file_summary_statistics}

echo -e "\n" >> ${file_summary_statistics}
sed -e "s/\r/\n/g" ${curl_progress_log} >> ${file_summary_statistics}

echo -e "\n" >> ${file_summary_statistics}
cat ${curl_trace_log} >> ${file_summary_statistics}

echo "#### $(date) ####" >> ${file_summary_statistics}

rm ${curl_statistic_log} ${curl_progress_log} ${curl_trace_log}

root@vm-cashoff01p:~#

root@vm-cashoff01p:~# find /tmp/ -name 2020\*-xxxx.test.connection.speed.txt -type f
/tmp/20200828-xxxx.test.connection.speed.txt
/tmp/20200831-xxxx.test.connection.speed.txt
/tmp/20200830-xxxx.test.connection.speed.txt
/tmp/20200827-xxxx.test.connection.speed.txt
/tmp/20200901-xxxx.test.connection.speed.txt
/tmp/20200902-xxxx.test.connection.speed.txt
/tmp/20200829-xxxx.test.connection.speed.txt
root@vm-cashoff01p:~# for var1 in $(find /tmp/ -name 2020\*-xxxx.test.connection.speed.txt -type f) ; do grep -ie "time_total=" $var1 | awk '{print $1}' | sort -hr ; done | head
time_total=6.152,
time_total=4.122,
time_total=3.443,
time_total=2.584,
time_total=2.515,
time_total=2.509,
time_total=2.504,
time_total=2.501,
time_total=2.501,
time_total=2.497,
root@vm-cashoff01p:~#
