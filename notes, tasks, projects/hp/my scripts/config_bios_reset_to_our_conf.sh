#!/bin/bash

# Please, be careful to add this script to auto-run-shell script shell.sh.
# Especially if you add to this auto-run-shell script other shell script that can define special of type of variable.
# It's exist chance to get loop - we will erase our BIOS settings every time or our reboot from this iso-image.
# And on several of the first conditions we reboot this server here. So if we have other step into auto-run-shell script - it will never run...


## SAMPLE. Change the NFS mount points to match your environment
PROFILE_DIR=${sstk_mount}
PROFILE_TYPE=${sstk_mount_type}
test -n "$sstk_mount_options" && PROFILE_OPTS="-o $sstk_mount_options"

## Internal Variables, do not modify
export TOOLKIT=/TOOLKIT
export SERVERNAME=

clear
echo -e "*** Resetting the BIOS to default ***"

export COUNT_OF_BOOT="`statemgr -r statemgr_count`"

if [ -n "${COUNT_OF_BOOT}" ] ; then

case "${COUNT_OF_BOOT}" in

	"0" )
		# Here we suppose that this is the first run of this script.
		# And possible, this is the first boot from this iso.
		# So, here we mark BIOS as required for reset.
		rbsureset

		echo -e "*** The special type of variable statemgr_count is set to follow value *** "
		statemgr -w statemgr_count 1
		sleep 5

		# Here we insert this iso into virtual CDROM.
		# It help us boot from this iso-image and apply our BIOS config.
		hponcfg -f ${TOOLKIT}/hponcfg.ribcl.insert.stk.iso.image.script.xml

		# Here we restart server and then, during server boot the BIOS will be actually resetted.		
		reboot
	;;

	"1" )
		# This is the second boot from this iso.
		# At this moment we suppose - the BIOS had already resetted.
		# Here we start write our BIOS configuration.
		${TOOLKIT}/config_bios.via_conrep.sh
		# or same thing just via hprcu utility.
		#${TOOLKIT}/config_bios.via_hprcu.sh

		# At this moment we may reboot server or may not. It depends on what will be our next step to configure this server.
		echo -e "*** The special type of variable statemgr_count is set to follow value *** "
		statemgr -w statemgr_count 2
		sleep 5

		# Here we insert this iso into virtual CDROM.
		# It helps us boot from this iso-image next time and continue applying our configuration.
		hponcfg -f ${TOOLKIT}/hponcfg.ribcl.insert.stk.iso.image.script.xml

		reboot
	;;

	"2" )
		# Here we know, that we have already two reboot from this iso,
		# and propably we already have properly applyed the BIOS configuration.

		echo -e "*** The special type of variable statemgr_count have follow value *** "
		statemgr -r statemgr_count

		echo -e "*** This server looks like already properly BIOS configured ***"
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

