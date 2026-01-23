#!/bin/bash

## SAMPLE. Change the NFS mount points to match your environment
PROFILE_DIR=${sstk_mount}
PROFILE_TYPE=${sstk_mount_type}
test -n "$sstk_mount_options" && PROFILE_OPTS="-o $sstk_mount_options"

## Internal Variables, do not modify
export TOOLKIT=/TOOLKIT
export PROFILE_MNT=/mnt/nfs
export HWDISC_FILE=/TOOLKIT/hpdiscovery.xml
export SERVERNAME=

clear
echo -e "*** Upgrading Firmware ***"

echo ""
echo "Loading storage drivers for hardware"
cd ${TOOLKIT}
./load_modules.sh

echo ""
echo "Pausing to allow drivers to finish loading"
sleep 15
echo ""

## rerun hardware discovery 
./hpdiscovery -f ${HWDISC_FILE}
echo "Hardware Discovery saved to ${HWDISC_FILE}"

echo "Mounting NFS Storage ${PROFILE_DIR}"
mkdir -p ${PROFILE_MNT}
mkdir -p ${TOOLKIT}/firmware
mount -t ${PROFILE_TYPE} ${PROFILE_DIR} ${PROFILE_MNT} ${PROFILE_OPTS}
if [ $? = 0 ] ; then
	## use hwquery to fetch the SystemName from hardware discovery file. ( extra " " are required ) 
	export "`./hwquery ${HWDISC_FILE} allboards.xml SERVERNAME=SystemName`";
	echo "Server Type: ${SERVERNAME}"
	if [ "${SERVERNAME}" = "ProLiant ML310 G5" ]; then
		echo -n "Updating ${SERVERNAME}"
		cp ${PROFILE_MNT}/firmware/CP011671.scexe ${TOOLKIT}/firmware/
		chmod +x ${TOOLKIT}/firmware/CP011671.scexe
		${TOOLKIT}/firmware/CP011671.scexe -s >/dev/null 2>/dev/null
		if [ $? != 0 ]; then
		echo -e "  -ROM is already up to date, no update needed\n"
		else
			echo -e "  -ROM updated"
		fi
		sleep 2s
	fi

	# Smart Array 5i Controller
	# PCI ID: 0E11B1780E114080
	./ifhw ${HWDISC_FILE} allboards.xml "PCI:Smart Array 5i Controller" 2>/dev/null
	if [ $? = 0 ]; then
		echo -n Updating "Smart Array 5i Controller"
		cp ${PROFILE_MNT}/firmware/cp005327.scexe ${TOOLKIT}/firmware/
		chmod +x ${TOOLKIT}/firmware/cp005327.scexe
		${PROFILE_MNT}/firmware/cp005327.scexe -s >/dev/null 2>/dev/null
		if [ $? != 0 ]; then
			echo -e "  -ROM is already up to date, no update needed\n"
		else
			echo -e "  -ROM updated"
		fi
		sleep 2s
	fi

	cd ${TOOLKIT}

	## unmount disk
	umount ${PROFILE_MNT}
fi

sleep 30
${TOOLKIT}/reboot

