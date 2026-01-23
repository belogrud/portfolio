
[root@smdw smartctl]# cat check_defects_on_hdd.sh
#!/bin/bash

email_body=""

let count1=0
for var1 in $(ssh root@mdw "(grep -e '^Elements in grown defect list' /var/log/smartctl.sg0.log | grep -o '[^ ]*$' )" ) ; do array1[${count1}]=${var1} ; let count1=count1+1 ; done     
let count2=0
for var2 in $(ssh root@mdw "(grep -e '^Serial number' /var/log/smartctl.sg0.log | grep -o '[^ ]*$'  )" ) ; do array2[${count2}]=${var2} ; let count2=count2+1 ; done

email_body_mdw=""
for var3 in ${!array1[*]}
 do
  if [ ${array1[${var3}]} -ne 0 ]
   then
    if [ -z "${email_body_mdw}" ]
     then
      email_body_mdw="Server name: mdw.\n$(ssh root@mdw "(lsscsi -g | awk '/sg0/{ print \$2, \$3, \$4}')")"
      email_body_mdw="${email_body_mdw}\n\nSerial number: ${array2[${var3}]}\nElements in grown defect list: ${array1[${var3}]}"
     else
      email_body_mdw="${email_body_mdw}\n\nSerial number: ${array2[${var3}]}\nElements in grown defect list: ${array1[${var3}]}"
    fi
   fi
 done

if [ -n "${email_body_mdw}" ]
 then
  email_body="${email_body}\n\n${email_body_mdw}"
 fi



let count1=0
for array1_index in ${!array1[*]} ; do unset "array1[${array1_index}]" ; done
for var1 in $(grep -e '^Elements in grown defect list' /var/log/smartctl.sg0.log | grep -o '[^ ]*$') ; do array1[${count1}]=${var1} ; let count1=count1+1 ; done
let count2=0
for array2_index in ${!array2[*]} ; do unset "array2[${array2_index}]" ; done
for var2 in $(grep -e '^Serial number' /var/log/smartctl.sg0.log | grep -o '[^ ]*$') ; do array2[${count2}]=${var2} ; let count2=count2+1 ; done

email_body_smdw=""
for var3 in ${!array1[*]}
 do
  if [ ${array1[${var3}]} -ne 0 ]
   then
    if [ -z "${email_body_smdw}" ]
     then
      email_body_smdw="\nServer name: smdw.\n$(lsscsi -g | awk '/sg0/{ print $2, $3, $4}')"
      email_body_smdw="${email_body_smdw}\n\nSerial number: ${array2[${var3}]}\nElements in grown defect list: ${array1[${var3}]}"
     else
      email_body_smdw="${email_body_smdw}\n\nSerial number: ${array2[${var3}]}\nElements in grown defect list: ${array1[${var3}]}"
    fi
   fi
 done

if [ -n "${email_body_smdw}" ]
 then
  email_body="${email_body}\n\n${email_body_smdw}"
 fi



for var4 in $(seq 1 8)
 do
  email_body_sdw[${var4}]=""
  for sg_num in 0 2
   do
    let count1=0
    for array1_index in ${!array1[*]} ; do unset "array1[${array1_index}]" ; done
    for var1 in $(ssh root@sdw${var4} "(grep -e '^Elements in grown defect list' /var/log/smartctl.sg${sg_num}.log | grep -o '[^ ]*$' )" ) ; do array1[${count1}]=${var1} ; let count1=count1+1 ; done
    let count2=0
    for array2_index in ${!array2[*]} ; do unset "array2[${array2_index}]" ; done
    for var2 in $(ssh root@sdw${var4} "(grep -e '^Serial number' /var/log/smartctl.sg${sg_num}.log | grep -o '[^ ]*$'  )" ) ; do array2[${count2}]=${var2} ; let count2=count2+1 ; done
    for var3 in ${!array1[*]}
     do
      if [ ${array1[${var3}]} -ne 0 ]
       then
        if [ -z "${email_body_sdw[${var4}]}" ]
         then
          email_body_sdw[${var4}]="\nServer name: sdw${var4}.\n$(ssh root@sdw${var4} "(lsscsi -g | awk '/sg${sg_num}/{ print \$2, \$3, \$4}')")"
          email_body_sdw[${var4}]="${email_body_sdw[${var4}]}\n\nSerial number: ${array2[${var3}]}\nElements in grown defect list: ${array1[${var3}]}"
          sg_same="yes"
         else
          if [ ${sg_same} = "yes" ]
           then
            email_body_sdw[${var4}]="${email_body_sdw[${var4}]}\n\nSerial number: ${array2[${var3}]}\nElements in grown defect list: ${array1[${var3}]}"
           else
            email_body_sdw[${var4}]="${email_body_sdw[${var4}]}\n\n$(ssh root@sdw${var4} "(lsscsi -g | awk '/sg${sg_num}/{ print \$2, \$3, \$4}')")"
            email_body_sdw[${var4}]="${email_body_sdw[${var4}]}\n\nSerial number: ${array2[${var3}]}\nElements in grown defect list: ${array1[${var3}]}"
            sg_same="yes"
          fi
        fi
       fi
     done
    sg_same="no"
   done
    if [ -n "${email_body_sdw[${var4}]}" ]
     then
      email_body="${email_body}\n\n${email_body_sdw[${var4}]}"
     fi
 done


if [ -n "${email_body}" ]
 then
  echo -e "${email_body}" | mailx -r "root" -s "GreenPlum ds-gp-tst contour. Defect(s) on HDD detected." smartctl@localhost
fi

[root@smdw smartctl]#
