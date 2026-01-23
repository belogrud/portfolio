#!/bin/bash                                                                      
## SAMPLE. Change the mount points to match your environment
PROFILE_DIR=${sstk_mount}                                   
PROFILE_TYPE=${sstk_mount_type}                             
test -n "$sstk_mount_options" && PROFILE_OPTS="-o $sstk_mount_options"

## Internal Variables, do not modify it
export TOOLKIT=/TOOLKIT 
export HWDISCOVERY_FILE=hpdiscovery.xml                                
export SERVERNAME=                                                

echo "Configure server -> BIOS"

## Run hardware discovery
hpdiscovery -f ${TOOLKIT}/${HWDISCOVERY_FILE}
echo "Hardware Discovery saved to ${TOOLKIT}/${HWDISCOVERY_FILE}"

## Use hwquery to fetch the SystemName from hardware discovery file. ( extra " " are required )
export "`hwquery ${TOOLKIT}/${HWDISCOVERY_FILE} ${TOOLKIT}/allboards.xml SERVERNAME=SystemName`";                         

HPRCUDAT=
echo "Server Type: ${SERVERNAME}"
case "${SERVERNAME}" in

        # ADD MORE SERVERS HERE

        "ProLiant DL380p Gen8" )
                # Apply BIOS Configuration for ProLiant DL380p Gen8.
                HPRCUDAT=${TOOLKIT}/hprcu.dl380p_gen8.bios.low_latency_set.xml
                # Add EXTRA DL380p Gen8 Configuration Steps HERE.
        ;;

        "ProLiant DL380p G7" )
		# We are sorry, but hprcu utility doesn't support G7 type of servers....
                echo "We are sorry, but gprcu utility doesn't support G7 type of servers..."
		echo "You should conrep utility instead."
        ;;

        ProLiant* )
                echo "No configuration process defined for this ProLiant server."
        ;;

        * )
                echo "Unrecognized Server."
        ;;
esac

if [ -n "$HPRCUDAT" ] ; then
        echo "Applying BIOS Configuration."
        hprcu -l -f ${HPRCUDAT}
fi

