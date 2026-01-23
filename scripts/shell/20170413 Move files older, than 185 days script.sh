#	20170413
#	SD#258384


[root@ds-db08-prod 20170404-1814]# pwd
/root/work/20170404-1814              
[root@ds-db08-prod 20170404-1814]#

[root@ds-db08-prod 20170404-1814]# ls -Alh /opt/TCS/scripts/move_files/movement.sh
-rwx------ 1 root root 2.2K Apr 13 15:46 /opt/TCS/scripts/move_files/movement.sh
[root@ds-db08-prod 20170404-1814]# awk '/movement/{print}' /var/spool/cron/root
1 2 * * * /opt/TCS/scripts/move_files/movement.sh
[root@ds-db08-prod 20170404-1814]#


[root@ds-db08-prod 20170404-1814]# cat movement.sh 
#!/bin/bash                                        

function move_files() {

    while read var1_filename
                do          
                        if [ $var0_count_of_files -lt 50 ]
                                then                      

                                        let var0_count_of_files++

                                        #echo -e "\$1: $1"
                                        #echo -e "var1_filename: ${var1_filename}"
                                        var1_dir_where_file_was_found="$(dirname "${var1_filename}")"
                                        var1_filename_that_was_found="$(basename "${var1_filename}")"
                                        #echo -e "var1_dir_where_file_was_found: ${var1_dir_where_file_was_found}\nvar1_filename_that_was_found: ${var1_filename_that_was_found}\n"

                                        var2_source_dir_subtract_one="$(dirname "$1")"
                                        var2_source_dir_last_subdir="$(basename "$1")"
                                        #echo -e "var2_source_dir_subtract_one: ${var2_source_dir_subtract_one}\nvar2_source_dir_last_subdir: ${var2_source_dir_last_subdir}\n"

                                        var3_destination_dir_stripped="${var1_dir_where_file_was_found#$var2_source_dir_subtract_one}"
                                        #echo -e "var3_destination_dir_stripped: ${var3_destination_dir_stripped}"


                                        mkdir -p "$2/${var3_destination_dir_stripped}"
                                        mv "${var1_filename}" "$2/${var3_destination_dir_stripped}"
                                        echo "$(date +%Y%m%d-%H%M): ${var1_filename} --> $2${var3_destination_dir_stripped}" >> /tmp/$3.$(/bin/basename $0).log
                                        #echo "$(date +%Y%m%d-%H%M): ${var1_filename} --> $2${var3_destination_dir_stripped}"

                                        # To reduce IO load on nfs storage was added pause in 30 seconds between movement of each file.
                                        sleep 30

                                fi

                done < <( find "$1" -type f -mtime +185 )

}


for pid in $(/sbin/pidof -x $(/bin/basename $0)) ; do
        if [ $pid != $$ ]; then
                echo "Process is already running with PID $pid"
                exit 1
        fi
done

var0_date_and_time="$(date +%Y%m%d-%H%M)"
let var0_count_of_files=0

move_files "/u04/oradata/exchprod/db/mastercard incoming files" "/mnt/processinglogs" "${var0_date_and_time}"
move_files "/u04/oradata/exchprod/db/visa incoming files" "/mnt/processinglogs" "${var0_date_and_time}"
move_files "/u04/oradata/exchprod/db/mastercard_pvv_files" "/mnt/processinglogs" "${var0_date_and_time}"
move_files "/u04/oradata/exchprod/db/visa parameter files" "/mnt/processinglogs" "${var0_date_and_time}"
move_files "/u04/oradata/exchprod/db/nspc_outgoing_files" "/mnt/processinglogs" "${var0_date_and_time}"

#echo "${var0_count_of_files}"

[root@ds-db08-prod 20170404-1814]#
