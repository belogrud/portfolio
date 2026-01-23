[root@ds-mvno-sorm-ftp01 ~]# cat /opt/sorm3/move_bulk_of_files_to_subdirs_structure.sh
#!/bin/bash

target_archive_directory="/mnt/sorm_exchange/archive"
a_file_with_list_of_files="/root/work/20190115-1850/20190115-1635.ls.mnt.sorm_exchange.archive.txt"

start_date="20170906"
end_date="20190114"

year_to_search="$(date +%Y -d "${start_date}")"
month_to_search="$(date +%m -d "${start_date}")"
day_to_search="$(date +%d -d "${start_date}")"

date_to_search="${year_to_search}${month_to_search}${day_to_search}"

until [ ${date_to_search} = "$(date +%Y%m%d -d "${end_date} + 1 day")" ] ;
    do
        pattern_for_search="_${date_to_search}_"
        found_files="$(/bin/egrep -e "${pattern_for_search}" ${a_file_with_list_of_files} | /bin/awk '{printf $NF " "}')"

        if [ -n "${found_files}" ] ;
            then
                mkdir -p ${target_archive_directory}/${year_to_search}/${month_to_search}/${day_to_search}
                for var1 in ${found_files} ;
                    do
                       mv ${target_archive_directory}/${var1} ${target_archive_directory}/${year_to_search}/${month_to_search}/${day_to_search}/ 2>/dev/nul
                    done
            fi

        date_to_search="$(date +%Y%m%d -d "${date_to_search} + 1 day")"

        year_to_search="$(date +%Y -d "${date_to_search}")"
        month_to_search="$(date +%m -d "${date_to_search}")"
        day_to_search="$(date +%d -d "${date_to_search}")"
    done

[root@ds-mvno-sorm-ftp01 ~]#


[root@ds-mvno-sorm-ftp01 ~]# head /root/work/20190115-1850/20190115-1635.ls.mnt.sorm_exchange.archive.txt
total 47G
drwxr-xr-x 2 root   root     16M Jan 15 16:34 .
drwxrwxrwx 5 root   root    280K Jan 15 16:32 ..
-rw-r--r-- 1 root   root     550 Sep 18  2017 ABONENT_20170906_0200.txt.gz
-rw-rw---- 1   1063 1002     587 Sep 28  2017 ABONENT_20170928_0200.txt.gz
-rw-rw---- 1   1063 1002     586 Sep 29  2017 ABONENT_20170929_0200.txt.gz
-rw-rw---- 1   1063 1002     654 Sep 30  2017 ABONENT_20170930_0200.txt.gz
-rw-rw---- 1   1063 1002     658 Oct  1  2017 ABONENT_20171001_0200.txt.gz
-rw-rw---- 1   1063 1002     653 Oct  2  2017 ABONENT_20171002_0200.txt.gz
-rw-rw---- 1   1063 1002     788 Oct  3  2017 ABONENT_20171003_0200.txt.gz
[root@ds-mvno-sorm-ftp01 ~]#
