#	https://vm-gitlab01.tcsbank.ru/tcs_tools/accounts-info/blob/master/acc-info.sh
#	Here is a body of acc-info.sh script.

#/bin/bash

LANG=C
HOST=`hostname -f`
TYPE=USER
SUDO_U=NO
SUDO_G=NO
ENABLE=ENABLED
USUDO=`mktemp`
GSUDO=`mktemp`
PASSWD=`mktemp`
ALL=`mktemp`

#SUDO BY USER
find /etc/sudoers* -type f -exec grep -v "^#" {} \; | sed '/^$/d' | awk ' $NF ~ /ALL/ {print $0}'| awk '{print $1}' | grep -v "^%"  > ${USUDO}

#SUDO BY GROUP
find /etc/sudoers* -type f -exec grep -v "^#" {} \; | sed '/^$/d' | awk ' $NF ~ /ALL/ {print $0}'| awk '{print $1}' | grep "^%" | sed 's/%//' > ${GSUDO}

print_header0(){
echo
echo -e "HOST: ${HOST}"
echo
}

print_header1(){
echo -n "SUDO USERS: "
for i in `cat $USUDO`; do echo -n "$i ";done
echo
echo -n "SUDO GROUPS: "
for i in `cat $GSUDO`; do echo -n "$i ";done
echo
echo
}

print_header2(){
echo -e "LOGIN \t\t STATUS TYPE SUDO_GROUP SUDO_USER"
echo
}

print_header_short(){
echo -e "LOGIN \t\t STATUS"
echo
}

for LOGIN in `awk -F: '{print $1}' /etc/passwd`
    do
        #ADMIN CHECK
        if $( id -nG ${LOGIN} | egrep -q 'wheel|root' )
            then
            	TYPE=ADMIN
            else
            	TYPE=USER
        fi

        #SUDO GROUP CHECK
        for i in $(cat ${GSUDO});
            do
            if $( groups ${LOGIN} | grep -q ${i} )
                then
                SUDO_G=${i}
            fi
        done

        #SUDO USER CHECK
        if  $(grep -q ${LOGIN} ${USUDO} )
            then
            	SUDO_U=YES
	    else
		SUDO_U=NO
        fi

        #LOCK CHECK
        if $( passwd -S ${LOGIN} | egrep -q  'Password locked.|LK' )
            then
            ENABLE=DISABLED
	    else
            ENABLE=ENABLED
        fi

        echo -e "${LOGIN} \t ${ENABLE} \t ${TYPE} \t ${SUDO_G} \t ${SUDO_U}" >> ${ALL}

done

case "$1" in
    	"--all")
	print_header0
	print_header1
	print_header2
	cat ${ALL} | column -t
	;;
	"--enabled")
	print_header0
	print_header1
	print_header2
	cat ${ALL} | column -t | grep ENABLED
        ;;
	"--disabled")
	print_header0
	print_header1
	print_header2
	cat ${ALL} | column -t | grep DISABLED
	;;
	"--short")
	print_header0
	print_header_short
	awk '{print $1, $2}' ${ALL} | column -t
	;;
	*)
	echo "Usage: `basename $0` --all [--short|--enabled|--disabled|--admins]"
	;;
esac


rm $USUDO $GSUDO $PASSWD $ALL
