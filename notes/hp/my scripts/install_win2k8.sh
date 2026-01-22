#!/bin/bash

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
echo "*** Performing Windows 2008 installation ***"

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

echo ""
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

if [ -n "$CONREPDAT" ] ; then
	echo "Apply System Configuration"
	./conrep -l -f${CONREPDAT}
fi

if [ -n "$HPACUDAT" ] ; then
	echo "Applying Array Configuration"
	hpacuscripting -i ${HPACUDAT}
fi


cd ${TOOLKIT}

echo "Pausing to allow drivers to catch up"
sleep 5

echo ""
echo "Rerun hardware discovery to find boot device"
./hpdiscovery -f ${HWDISC_FILE}

## use hwquery to fetch the boot dev node from hardware discovery file.
if [ -z ${BOOTDEVNODE} ]; then
	export `./hwquery ${HWDISC_FILE} allboards.xml BOOTDEVNODE=DevNode`
fi

echo "Boot Device=${BOOTDEVNODE}"

if [ -z ${BOOTDEVNODE} ]; then
	echo "MISSING boot device dev node. Check that the drivers are loaded."
	exec /bin/bash
fi

ls -al ${BOOTDEVNODE}*
ln -s ${BOOTDEVNODE} /dev/sssd


echo "*** Preparing Windows 2008 Unattended Install ***"

echo "clearing mbr and a few more sectors"
dd if=/dev/zero of=/dev/sssd bs=512 count=32

echo "forcing kernel to re-read partition table"
sfdisk --re-read /dev/sssd
sleep 5

echo "landing mbr"
dd if=${PROFILE_MNT}/windows_unattend/freedos.mbr of=/dev/sssd bs=512 count=1

echo "create new 8192 MB NTFS partition using sfdisk"
echo "0,8192,7,*" | sfdisk -uM -D /dev/sssd

echo "forcing kernel to re-read partition table"
sfdisk --re-read /dev/sssd

sleep 5

## make symlink for first partition, usually sda1 or c0d0p1
if test -e ${BOOTDEVNODE}1 ; then
	ln -s ${BOOTDEVNODE}1 /dev/sssd1
elif test -e ${BOOTDEVNODE}p1 ; then
	ln -s ${BOOTDEVNODE}p1 /dev/sssd1
else
	echo "Partition 1 missing, check that partition creation succeeded"
	exec /bin/bash
fi

ls -la /dev/sssd1

echo "clearing partition vbr and a few more sectors"
dd if=/dev/zero of=/dev/sssd1 bs=512 count=32

echo "creating NTFS filesystem"
mkntfs -Q /dev/sssd1

modprobe fuse

sleep 5

## TEMP: use static boot sector/file
## MFT Moved???
cp ${PROFILE_MNT}/windows_unattend/bootmgr.bss ${TOOLKIT}/boot.bin
#bpbpatch /dev/sssd1 ${TOOLKIT}/boot.bin
dd if=/dev/sssd1 skip=3 of=${TOOLKIT}/boot.bin seek=3 bs=1 count=81 conv=notrunc
ntfscp /dev/sssd1 ${TOOLKIT}/boot.bin \$Boot

## mount disk
echo "mounting to /mnt/dos"
ntfs-3g /dev/sssd1 /mnt/dos

echo "Copying WinPE Installation"
cp -a --preserve=timestamps ${PROFILE_MNT}/windows_unattend/winpe/* /mnt/dos/

###

cd ${TOOLKIT}

## unmount disk
echo "Unmounting and flushing /mnt/dos"
umount /mnt/dos
umount ${PROFILE_MNT}

## unmount everything else
umount -a

echo "Rebooting"
sleep 5

/bin/reboot c:
