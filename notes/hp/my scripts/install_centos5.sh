#!/bin/bash

## this script installs CentOS 5

## SAMPLE. Change the mount points to match your environment
PROFILE_DIR=${sstk_mount}
PROFILE_TYPE=${sstk_mount_type}
test -n "$sstk_mount_options" && PROFILE_OPTS="-o $sstk_mount_options"

## Internal Variables, do not modify
export TOOLKIT=/TOOLKIT
export PROFILE_MNT=/mnt/nfs
export HWDISC_FILE=/TOOLKIT/hpdiscovery.xml
export SERVERNAME=
export BOOTDEVNODE=

clear
echo "*** Performing CENTOS 5 installation ***"

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


echo "Mounting Storage ${PROFILE_DIR}"
mkdir -p ${PROFILE_MNT}
mount -t ${PROFILE_TYPE} ${PROFILE_DIR} ${PROFILE_MNT} ${PROFILE_OPTS}
if [ $? != 0 ]; then
	echo "Unable to mount ${PROFILE_DIR}, make sure you updated the $0 script with the location of your server."
	exec /bin/bash
fi


echo "Configure server"

## run hardware discovery
./hpdiscovery -f ${HWDISC_FILE}

## use hwquery to fetch the SystemName from hardware discovery file. ( extra " " are required )
export "`./hwquery ${HWDISC_FILE} allboards.xml SERVERNAME=SystemName`";

CONREPDAT=
HPACUDAT=
echo "Server Type: ${SERVERNAME}"
case "${SERVERNAME}" in
	"ProLiant DL380 G4" )
		CONREPDAT=${PROFILE_MNT}/data_files/dl380g4_conrep.dat
		./ifhw ${HWDISC_FILE} allboards.xml "PCI:Smart Array 6i Controller" 2> /dev/null
		if [ $? = 0 ] ; then
			HPACUDAT=${PROFILE_MNT}/data_files/dl380g4_sa6i_cpqacuxe.dat
		fi
		# Apply Array Configuration for Smart Array P600 Controller if present
		./ifhw ${HWDISC_FILE} allboards.xml "PCI:Smart Array P600 Controller" 2> /dev/null
		if [ $? = 0 ] ; then
			HPACUDAT=${PROFILE_MNT}/data_files/dl380g4_p600_cpqacuxe.dat
		fi
		## ADD EXTRA DL380 G4 Configuration Steps HERE
	;;
	"ProLiant DL380 G3" )
		CONREPDAT=${PROFILE_MNT}/data_files/dl380g3_conrep.dat

		# Apply Array Configuration for Smart Array 6i Controller if present
		./ifhw ${HWDISC_FILE} allboards.xml "PCI:Smart Array 6i Controller" 2> /dev/null
		if [ $? = 0 ] ; then
			HPACUDAT=${PROFILE_MNT}/data_files/dl380g3_sa6i_cpqacuxe.dat
		fi

		## ADD EXTRA DL380 G3 Configuration Steps HERE
	;;

	"ProLiant BL45p G1" )
		CONREPDAT=${PROFILE_MNT}/data_files/bl45pg1_conrep.dat
		# Apply Array Configuration for Smart Array 6i Controller if present
		./ifhw ${HWDISC_FILE} allboards.xml "PCI:Smart Array 6i Controller" 2> /dev/null
		if [ $? = 0 ] ; then
			HPACUDAT=${PROFILE_MNT}/data_files/bl45pg1_sa6i_cpqacuxe.dat
		fi

		## ADD EXTRA BL45p G1 Configuration Steps HERE

	;;

	"ProLiant ML310 G2" )
		CONREPDAT=${PROFILE_MNT}/data_files/ml310g2_conrep.dat

		./ifhw ${HWDISC_FILE} allboards.xml "PCI:Intel(R) 6300ESB Ultra ATA Storage/SATA Controller"
		if [ $? = 0 ] ; then
			echo "Plain SATA found"
			# Plain SATA, set BOOTDEVNODE manually since hardware discovery won't find IDE devices
			export BOOTDEVNODE=/dev/hda
		fi

		## ADD EXTRA ProLiant ML310 G2 Configuration Steps HERE
	;;

	"ProLiant DL160 G6" )
		CONREPDAT=${PROFILE_MNT}/data_files/dl160g6_conrep.dat
		HPACUDAT=${PROFILE_MNT}/data_files/bl45pg1_sa6i_cpqacuxe.dat

		## ADD EXTRA ProLiant DL160 G6 Configuration Steps HERE
	;;

	"ProLiant DL580 G7" )
		CONREPDAT=${PROFILE_MNT}/data_files/dl580g7_conrep.dat
		HPACUDAT=${PROFILE_MNT}/data_files/sa400i_cpqacuxe.dat

		## ADD EXTRA ProLiant DL580 G7 Configuration Steps HERE
	;;



	"ProLiant ML310"* ) 
	;;
	"ProLiant BL10e" )
		export BOOTDEVNODE=/dev/hda
	;;

	## ADD MORE SERVERS HERE

	ProLiant* )
		echo "No configuration process defined for this ProLiant server"
		echo "Update $0 with steps for this ProLiant server"
		exec /bin/bash
	;;

	* )
		echo "Unrecognized Server"
		exec /bin/bash
	;;
esac

## CONTINUE COMMON INSTALL PROCESS

if [ -f "$CONREPDAT" ] ; then
	echo "Apply System Configuration"
	./conrep -l -f${CONREPDAT}
fi

if [ -f "$HPACUDAT" ] ; then
	echo "Applying Array Configuration"
	hpacuscripting -i ${HPACUDAT}
fi

cd ${TOOLKIT}

echo "Pausing to allow drivers to catch up"
sleep 5

echo "### Linux Unattended Install using Kickstart ###"

cd /root

#
# Next block of commands fetches the kernel and inital ramdisk from the installation media
# you can fetch it using a variety of methods, we are using wget in this example
#
echo "Get the CentOS kernel and initrd image"
rm -f vmlinuz initrd.img
wget http://linuxcoe.corp.hp.com/linuxcoe/CentOS/5.5/os/x86_64/isolinux/vmlinuz
wget http://linuxcoe.corp.hp.com/linuxcoe/CentOS/5.5/os/x86_64/isolinux/initrd.img
kexec -l vmlinuz --initrd=initrd.img --args-linux --append="ksdevice=eth0 ide=nodma ide=noraid pnpbios=off ks=nfs:10.7.85.5:/nfs/CENTOS5.5-x86_64-install/ks.cfg"


sync
umount ${PROFILE_MNT}

# unmount everything else
umount -a

# unload drivers to prevent potential problems
lsmod | awk '{print $1}' | xargs rmmod

# wait a few seconds for good measure
sleep 10

echo "Calling kexec"
kexec -e

echo "YOU SHOULD NEVER SEE THIS"
