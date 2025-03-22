# Check filesystem on GreenPlum servers 

[root@smdw_test 20140123-2200]# cat xfs.check.mdw.sh
#!/bin/bash

#umount /work && umount /data
umount -f -l /work /data
retval=$?
if [ $retval -ne 0 ]; then
        echo "FAIL. Someone partition was not unmounted. Return code: $retval"
        exit 1
fi

filename="$(date +%Y%m%d-%H%M)"

echo "$(date +%Y%m%d-%H%M)" >> ${filename}.fsck.log

fsck -VMCR -ay 2>&1 | tee -a ${filename}.fsck.log

echo "$(date +%Y%m%d-%H%M)" >> ${filename}.fsck.log

mount /work && mount /data
if [ $? -eq 0 ]; then
    echo "OK. All partition mounted successfuly."
else
    echo "FAIL. Someone partition was not mounted."
fi

[root@smdw_test 20140123-2200]#

[root@smdw_test 20140123-2200]# cat xfs.check.sdw.sh
#!/bin/bash

#umount /work1 && umount /data1 && umount /work2 && umount /data2
umount -f -l /work1 /data1 /work2 /data2
retval=$?
if [ $retval -ne 0 ]; then
        echo "FAIL. Someone partition was not unmounted. Return code: $retval"
        exit 1
fi

filename="$(date +%Y%m%d-%H%M)"

echo "$(date +%Y%m%d-%H%M)" >> ${filename}.fsck.log

fsck -VMCR -ay 2>&1 | tee -a ${filename}.fsck.log

echo "$(date +%Y%m%d-%H%M)" >> ${filename}.fsck.log

mount /work1 && mount /data1 && mount /work2 && mount /data2
if [ $? -eq 0 ]; then
    echo "OK. All partition mounted successfuly."
else
    echo "FAIL. Someone partition was not mounted."
fi


[root@smdw_test 20140123-2200]#
