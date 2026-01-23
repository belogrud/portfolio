#!/bin/bash

## SAMPLE. Change the NFS mount points to match your environment
PROFILE_DIR=${sstk_mount}
PROFILE_TYPE=${sstk_mount_type}
test -n "$sstk_mount_options" && PROFILE_OPTS="-o $sstk_mount_options"

## Internal Variables, do not modify
export TOOLKIT=/TOOLKIT
export SERVERNAME=

clear
echo -e "*** Upgrading Firmware ***"

export COUNT_OF_BOOT="`statemgr -r statemgr_count`"

if [ -n "${COUNT_OF_BOOT}" ] ; then

case "${COUNT_OF_BOOT}" in

	"0" )
		# Here we suppose that this is the first run of this script.
		# This is the first boot from this iso.
		# Wherefore we start update for HP Intelligent Provisioning.
		hponcfg -f ${TOOLKIT}/hponcfg.insert.ip.iso.image.ribcl.script.xml
		hponcfg -f ${TOOLKIT}/hponcfg.check.status.iso.image.ribcl.script.xml

		echo -e "*** The special type of variable statemgr_count is set to follow value *** "
		statemgr -w statemgr_count 1
		sleep 5

		reboot
	;;

	"1" )
		# This is the second boot from this iso.
		# So here we start update from SPP.
		hponcfg -f ${TOOLKIT}/hponcfg.insert.spp.iso.image.ribcl.script.xml
		hponcfg -f ${TOOLKIT}/hponcfg.check.status.iso.image.ribcl.script.xml

		echo -e "*** The special type of variable statemgr_count is set to follow value *** "
		statemgr -w statemgr_count 2
		sleep 5

		reboot
	;;

	"2" )
		# Here we know that we have already two boot from this iso,
		# and propably we already update "HP Intelligent Provisioning" and firmware from SPP.

		echo -e "*** The special type of variable statemgr_count is set to follow value *** "
		statemgr -r statemgr_count

		echo -e "*** This server looks like already updated (IP and SPP) ***"
		# So, I think it's good idea to clean our variable for next time using.
		statemgr -w statemgr_count 0
	;;

	* )
		# Here we don't know what this mean...
		echo -e "*** We don't know what this value mean, so wherefore we just interrupt this script ***"
	;;
esac

else
	# Here we don't know what this mean...
	echo -e "*** Very very strange... If everything is OK it will never be displayed. Possible, there is a glitch was detected ***"
fi

