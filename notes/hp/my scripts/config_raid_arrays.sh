#!/bin/bash                                                                      

## SAMPLE. Change the mount points to match your environment
PROFILE_DIR=${sstk_mount}                                   
PROFILE_TYPE=${sstk_mount_type}                             
test -n "$sstk_mount_options" && PROFILE_OPTS="-o $sstk_mount_options"

## Internal Variables, do not modify it
export TOOLKIT=/TOOLKIT 
export HWDISCOVERY_FILE=hpdiscovery.xml                                
export SERVERNAME=                                                

echo "Configure server"

## run hardware discovery
hpdiscovery -f ${TOOLKIT}/${HWDISCOVERY_FILE}
echo "Hardware Discovery saved to ${TOOLKIT}/${HWDISCOVERY_FILE}"

## use hwquery to fetch the SystemName from hardware discovery file. ( extra " " are required )
export "`hwquery ${TOOLKIT}/${HWDISCOVERY_FILE} ${TOOLKIT}/allboards.xml SERVERNAME=SystemName`";                         

CONREPDAT=
HPACUDAT=
echo "Server Type: ${SERVERNAME}"
case "${SERVERNAME}" in

        # ADD MORE SERVERS HERE

        "ProLiant DL380p Gen8" )
                # Apply Array Configuration for Smart Array P420 Controller if present (internal or external).
                ifhw ${HWDISCOVERY_FILE} allboards.xml "PCI:HP Smart Array P420i Controller" or "PCI:HP Smart Array P420 Controller" # 2> /dev/null
                if [ $? = 0 ] ; then
                        HPACUDAT=${TOOLKIT}/hpssascripting.raid10.any_controllers.all_drives.no_spare.dat
                fi
                # Add EXTRA DL380p Gen8 Configuration Steps HERE.
        ;;

        "ProLiant DL380p G7" )
                # Apply Array Configuration for Smart Array P410 Controller if present (internal or external).
                ifhw ${HWDISCOVERY_FILE} allboards.xml "PCI:HP Smart Array P410i Controller" or "PCI:HP Smart Array P410 Controller" # 2> /dev/null
                if [ $? = 0 ] ; then
                        HPACUDAT=${TOOLKIT}/hpssascripting.raid10.any_controllers.all_drives.no_spare.dat
                fi
                # Add EXTRA DL380 G7 Configuration Steps HERE.
        ;;

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

if [ -n "$HPACUDAT" ] ; then
        echo "Applying Array Configuration"
        hpssascripting -i ${HPACUDAT} -reset
fi

