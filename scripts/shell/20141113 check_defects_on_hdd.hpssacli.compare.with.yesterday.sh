

[root@smdw hpssacli]# cat /opt/TCS/scripts/hpssacli/check_defects_on_hdd.hpssacli.compare.with.yesterday.sh 
#!/bin/bash                                                                                                 

email_body=""
date_before="$(date +%Y%m%d -d "1 day ago")"

let count1=0
for array1_index in ${!array1[*]} ; do unset "array1[${array1_index}]" ; done
for var1 in $( ssh root@mdw "( unzip -p /var/log/hpssacli.diag.zip ADUReport.xml | grep -E -e 'Device deviceType=\"ArrayController\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Factory\)\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -e 'Device deviceType=\"PhysicalDrive\"' -e 'MetaProperty id=\"Serial Number\"' -e 'MetaProperty id=\"Read Errors Hard\"' | grep -E -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -A 2 | grep -e 'MetaProperty id=\"Read Errors Hard\"' | sed -e 's/.*value=\"\(.*\)\"\/>/\1/' | sed 's/.$//' )" ) ; do array1[${count1}]=${var1} ; let count1=count1+1 ; done                                                                                                                 
let count2=0                                                                                                                                                                                        
for array2_index in ${!array2[*]} ; do unset "array2[${array2_index}]" ; done                                                                                                                       
for var2 in $( ssh root@mdw "( unzip -p /var/log/hpssacli.diag.zip ADUReport.xml | grep -E -e 'Device deviceType=\"ArrayController\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Factory\)\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -e 'Device deviceType=\"PhysicalDrive\"' -e 'MetaProperty id=\"Serial Number\"' -e 'MetaProperty id=\"Read Errors Hard\"' | grep -E -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -A 2 | grep -e 'MetaProperty id=\"Serial Number\"' | sed -e 's/.*value=\"\(.*\)\"\/>/\1/' | sed 's/.$//' )" ) ; do array2[${count2}]=${var2} ; let count2=count2+1 ; done                                                                                                                    

let count1=0
for array3_index in ${!array3[*]} ; do unset "array3[${array3_index}]" ; done
for var1 in $( ssh root@mdw "( unzip -p /var/log/hpssacli.diag.zip-${date_before} ADUReport.xml | grep -E -e 'Device deviceType=\"ArrayController\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Factory\)\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -e 'Device deviceType=\"PhysicalDrive\"' -e 'MetaProperty id=\"Serial Number\"' -e 'MetaProperty id=\"Read Errors Hard\"' | grep -E -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -A 2 | grep -e 'MetaProperty id=\"Read Errors Hard\"' | sed -e 's/.*value=\"\(.*\)\"\/>/\1/' | sed 's/.$//' )" ) ; do array3[${count1}]=${var1} ; let count1=count1+1 ; done                                                                                                  
let count2=0                                                                                                                                                                                        
for array4_index in ${!array4[*]} ; do unset "array4[${array4_index}]" ; done                                                                                                                       
for var2 in $( ssh root@mdw "( unzip -p /var/log/hpssacli.diag.zip-${date_before} ADUReport.xml | grep -E -e 'Device deviceType=\"ArrayController\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Factory\)\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -e 'Device deviceType=\"PhysicalDrive\"' -e 'MetaProperty id=\"Serial Number\"' -e 'MetaProperty id=\"Read Errors Hard\"' | grep -E -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -A 2 | grep -e 'MetaProperty id=\"Serial Number\"' | sed -e 's/.*value=\"\(.*\)\"\/>/\1/' | sed 's/.$//' )" ) ; do array4[${count2}]=${var2} ; let count2=count2+1 ; done                                                                                                     

email_body_mdw=""
for var3 in ${!array1[*]}
 do                      
  if [ ${array1[${var3}]} != "0x00000000" ]
   then                                    
    for var5 in ${!array3[*]}              
     do                                    
      if [ ${array2[${var3}]} = ${array4[${var5}]}  ]
       then                                          
        delta="$(echo $((${array1[${var3}]} - ${array3[${var5}]})))"
         if [ ${delta} != "0"  ]                                    
          then                                                      
           if [ -z "${email_body_mdw}" ]                            
            then                                                    
             email_body_mdw="\nServer name: mdw."                   
             email_body_mdw="${email_body_mdw}\n\nSerial number: ${array2[${var3}]}\nRead Errors Hard: ${array1[${var3}]}\nAt this moment, by compared with yesterday, it increased on (decimal): ${delta}"                                                                                                                                                                                             
            else                                                                                                                                                                                    
             email_body_mdw="${email_body_mdw}\n\nSerial number: ${array2[${var3}]}\nRead Errors Hard: ${array1[${var3}]}\nAt this moment, by compared with yesterday, it increased on (decimal): ${delta}"                                                                                                                                                                                             
           fi                                                                                                                                                                                       
         fi                                                                                                                                                                                         
      fi                                                                                                                                                                                            
     done                                                                                                                                                                                           
   fi                                                                                                                                                                                               
 done                                                                                                                                                                                               

if [ -n "${email_body_mdw}" ]
 then                        
  email_body="${email_body}\n\n${email_body_mdw}"
 fi                                              



let count1=0
for array1_index in ${!array1[*]} ; do unset "array1[${array1_index}]" ; done
for var1 in $( unzip -p /var/log/hpssacli.diag.zip ADUReport.xml | grep -E -e 'Device deviceType="ArrayController"' -e 'MetaStructure id="Monitor and Performance Statistics \(Since Factory\)"' -e 'MetaStructure id="Monitor and Performance Statistics \(Since Reset\)"' -e 'Device deviceType="PhysicalDrive"' -e 'MetaProperty id="Serial Number"' -e 'MetaProperty id="Read Errors Hard"' | grep -E -e 'MetaStructure id="Monitor and Performance Statistics \(Since Reset\)"' -A 2 | grep -e 'MetaProperty id="Read Errors Hard"' | sed -e 's/.*value="\(.*\)"\/>/\1/' | sed 's/.$//' ) ; do array1[${count1}]=${var1} ; let count1=count1+1 ; done                                                                                                                                                      
let count2=0                                                                                                                                                                                        
for array2_index in ${!array2[*]} ; do unset "array2[${array2_index}]" ; done                                                                                                                       
for var2 in $( unzip -p /var/log/hpssacli.diag.zip ADUReport.xml | grep -E -e 'Device deviceType="ArrayController"' -e 'MetaStructure id="Monitor and Performance Statistics \(Since Factory\)"' -e 'MetaStructure id="Monitor and Performance Statistics \(Since Reset\)"' -e 'Device deviceType="PhysicalDrive"' -e 'MetaProperty id="Serial Number"' -e 'MetaProperty id="Read Errors Hard"' | grep -E -e 'MetaStructure id="Monitor and Performance Statistics \(Since Reset\)"' -A 2 | grep -e 'MetaProperty id="Serial Number"' | sed -e 's/.*value="\(.*\)"\/>/\1/' | sed 's/.$//' ) ; do array2[${count2}]=${var2} ; let count2=count2+1 ; done                                                                                                                                                         

let count1=0
for array3_index in ${!array3[*]} ; do unset "array3[${array3_index}]" ; done
for var1 in $( unzip -p /var/log/hpssacli.diag.zip-${date_before} ADUReport.xml | grep -E -e 'Device deviceType="ArrayController"' -e 'MetaStructure id="Monitor and Performance Statistics \(Since Factory\)"' -e 'MetaStructure id="Monitor and Performance Statistics \(Since Reset\)"' -e 'Device deviceType="PhysicalDrive"' -e 'MetaProperty id="Serial Number"' -e 'MetaProperty id="Read Errors Hard"' | grep -E -e 'MetaStructure id="Monitor and Performance Statistics \(Since Reset\)"' -A 2 | grep -e 'MetaProperty id="Read Errors Hard"' | sed -e 's/.*value="\(.*\)"\/>/\1/' | sed 's/.$//' ) ; do array3[${count1}]=${var1} ; let count1=count1+1 ; done                                                                                                                                       
let count2=0                                                                                                                                                                                        
for array4_index in ${!array4[*]} ; do unset "array4[${array4_index}]" ; done                                                                                                                       
for var2 in $( unzip -p /var/log/hpssacli.diag.zip-${date_before} ADUReport.xml | grep -E -e 'Device deviceType="ArrayController"' -e 'MetaStructure id="Monitor and Performance Statistics \(Since Factory\)"' -e 'MetaStructure id="Monitor and Performance Statistics \(Since Reset\)"' -e 'Device deviceType="PhysicalDrive"' -e 'MetaProperty id="Serial Number"' -e 'MetaProperty id="Read Errors Hard"' | grep -E -e 'MetaStructure id="Monitor and Performance Statistics \(Since Reset\)"' -A 2 | grep -e 'MetaProperty id="Serial Number"' | sed -e 's/.*value="\(.*\)"\/>/\1/' | sed 's/.$//' ) ; do array4[${count2}]=${var2} ; let count2=count2+1 ; done                                                                                                                                          


email_body_smdw=""
for var3 in ${!array1[*]}
 do                      
  if [ ${array1[${var3}]} != "0x00000000" ]
   then                                    
    for var5 in ${!array3[*]}              
     do                                    
      if [ ${array2[${var3}]} = ${array4[${var5}]}  ]
       then                                          
        delta="$(echo $((${array1[${var3}]} - ${array3[${var5}]})))"
         if [ ${delta} != "0"  ]                                    
          then                                                      
           if [ -z "${email_body_smdw}" ]                           
            then                                                    
             email_body_smdw="\nServer name: smdw."                 
             email_body_smdw="${email_body_smdw}\n\nSerial number: ${array2[${var3}]}\nRead Errors Hard: ${array1[${var3}]}\nAt this moment, by compared with yesterday, it increased on (decimal): ${delta}"                                                                                                                                                                                           
            else                                                                                                                                                                                    
             email_body_smdw="${email_body_smdw}\n\nSerial number: ${array2[${var3}]}\nRead Errors Hard: ${array1[${var3}]}\nAt this moment, by compared with yesterday, it increased on (decimal): ${delta}"                                                                                                                                                                                           
           fi                                                                                                                                                                                       
         fi                                                                                                                                                                                         
      fi                                                                                                                                                                                            
     done                                                                                                                                                                                           
   fi                                                                                                                                                                                               
 done                                                                                                                                                                                               

if [ -n "${email_body_smdw}" ]
 then                         
  email_body="${email_body}\n\n${email_body_smdw}"
 fi                                               


for var4 in $(seq 1 8)
 do                   
  email_body_sdw[${var4}]=""
  let count1=0              
  for array1_index in ${!array1[*]} ; do unset "array1[${array1_index}]" ; done
  for var1 in $( ssh root@sdw${var4} "( unzip -p /var/log/hpssacli.diag.zip ADUReport.xml | grep -E -e 'Device deviceType=\"ArrayController\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Factory\)\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -e 'Device deviceType=\"PhysicalDrive\"' -e 'MetaProperty id=\"Serial Number\"' -e 'MetaProperty id=\"Read Errors Hard\"' | grep -E -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -A 2 | grep -e 'MetaProperty id=\"Read Errors Hard\"' | sed -e 's/.*value=\"\(.*\)\"\/>/\1/' | sed 's/.$//' )" ) ; do array1[${count1}]=${var1} ; let count1=count1+1 ; done                                                                                                        
  let count2=0                                                                                                                                                                                      
  for array2_index in ${!array2[*]} ; do unset "array2[${array2_index}]" ; done                                                                                                                     
  for var2 in $( ssh root@sdw${var4} "( unzip -p /var/log/hpssacli.diag.zip ADUReport.xml | grep -E -e 'Device deviceType=\"ArrayController\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Factory\)\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -e 'Device deviceType=\"PhysicalDrive\"' -e 'MetaProperty id=\"Serial Number\"' -e 'MetaProperty id=\"Read Errors Hard\"' | grep -E -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -A 2 | grep -e 'MetaProperty id=\"Serial Number\"' | sed -e 's/.*value=\"\(.*\)\"\/>/\1/' | sed 's/.$//' )" ) ; do array2[${count2}]=${var2} ; let count2=count2+1 ; done                                                                                                           

  let count1=0
  for array3_index in ${!array3[*]} ; do unset "array3[${array3_index}]" ; done
  for var1 in $( ssh root@sdw${var4} "( unzip -p /var/log/hpssacli.diag.zip-${date_before} ADUReport.xml | grep -E -e 'Device deviceType=\"ArrayController\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Factory\)\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -e 'Device deviceType=\"PhysicalDrive\"' -e 'MetaProperty id=\"Serial Number\"' -e 'MetaProperty id=\"Read Errors Hard\"' | grep -E -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -A 2 | grep -e 'MetaProperty id=\"Read Errors Hard\"' | sed -e 's/.*value=\"\(.*\)\"\/>/\1/' | sed 's/.$//' )" ) ; do array3[${count1}]=${var1} ; let count1=count1+1 ; done
  let count2=0
  for array4_index in ${!array4[*]} ; do unset "array4[${array4_index}]" ; done
  for var2 in $( ssh root@sdw${var4} "( unzip -p /var/log/hpssacli.diag.zip-${date_before} ADUReport.xml | grep -E -e 'Device deviceType=\"ArrayController\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Factory\)\"' -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -e 'Device deviceType=\"PhysicalDrive\"' -e 'MetaProperty id=\"Serial Number\"' -e 'MetaProperty id=\"Read Errors Hard\"' | grep -E -e 'MetaStructure id=\"Monitor and Performance Statistics \(Since Reset\)\"' -A 2 | grep -e 'MetaProperty id=\"Serial Number\"' | sed -e 's/.*value=\"\(.*\)\"\/>/\1/' | sed 's/.$//' )" ) ; do array4[${count2}]=${var2} ; let count2=count2+1 ; done

 for var3 in ${!array1[*]}
  do
   if [ ${array1[${var3}]} != "0x00000000" ]
    then
     for var5 in ${!array3[*]}
      do
       if [ ${array2[${var3}]} = ${array4[${var5}]}  ]
        then
         delta="$(echo $((${array1[${var3}]} - ${array3[${var5}]})))"
          if [ ${delta} != "0"  ]
           then
            if [ -z "${email_body_sdw[${var4}]}" ]
             then
              email_body_sdw[${var4}]="\nServer name: sdw${var4}."
              email_body_sdw[${var4}]="${email_body_sdw[${var4}]}\n\nSerial number: ${array2[${var3}]}\nRead Errors Hard: ${array1[${var3}]}\nAt this moment, by compared with yesterday, it increased on (decimal): ${delta}"
             else
              email_body_sdw[${var4}]="${email_body_sdw[${var4}]}\n\nSerial number: ${array2[${var3}]}\nRead Errors Hard: ${array1[${var3}]}\nAt this moment, by compared with yesterday, it increased on (decimal): ${delta}"
            fi
          fi
       fi
      done
    fi
  done
  if [ -n "${email_body_sdw[${var4}]}" ]
   then
    email_body="${email_body}\n\n${email_body_sdw[${var4}]}"
  fi
 done


if [ -n "${email_body}" ]
 then
  echo -e "${email_body}" | mailx -r "root" -s "GreenPlum ds-gp-tst contour. Defect(s) on HDD detected." hpssacli@localhost
fi

[root@smdw hpssacli]#
