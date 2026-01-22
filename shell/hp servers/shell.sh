#!/bin/bash

modprobe -f cciss
modprobe -f hpsa

# This two line just for example that we can do that.
/etc/init.d/hp-health start
hpasmcli -s "show server"

# Get existing information about installed on this server hardware.
hpdiscovery -f /tmp/$(date +%Y%m%d-%H%M).hpdiscovery.xml

# Here it saved current BIOS configuration only with current defined options.
conrep -s -f /tmp/$(date +%Y%m%d-%H%M).conrep.dat
# Here we can find current BIOS config with current options and with all available options that could be possible.
hprcu -s -f /tmp/$(date +%Y%m%d-%H%M).hprcu.xml
hprcu -s -t -f /tmp/$(date +%Y%m%d-%H%M).hprcu.with_t_flag.xml
hprcu -a -s -t -f /tmp/$(date +%Y%m%d-%H%M).hprcu.with_t_and_a_flag.xml

# Here we save current raid-arrays configuration.
hpssascripting -c /tmp/$(date +%Y%m%d-%H%M).hpssascripting.dat
# Here we save raid-arrays configuration with more human readable format.
hpssacli controller all show config > /tmp/$(date +%Y%m%d-%H%M).hpssacli.txt

# Here we save current iLO configuration.
hponcfg -w /tmp/$(date +%Y%m%d-%H%M).hponcfg.dat

# Mount this bootable iso-image for ony other purposes.
# For example, we can extract previously saved backup .tgz file, that contain root file system.
mount -o ro /dev/cdrom /mnt/cdrom


# Write our wishes for configuring server's hardware.

# Here we can configure BIOS settings for this server.
# Directly.
#conrep -l -f /TOOLKIT/conrep.dl380p_gen8.bios.low_latency_set.xml
#hprcu -l -f /TOOLKIT/hprcu.dl380p_gen8.bios.low_latency_set.xml
# Or via script.
#/TOOLKIT/config_bios.via_conrep.sh
#/TOOLKIT/config_bios.via_hprcu.sh

# Here we can run script that make properly raid-array configuration.
# Directly.
#hpssascripting -i /TOOLKIT/hpssascripting.raid10.any_controllers.all_drives.no_spare.dat -reset
# Or via script.
#/TOOLKIT/config_raid_arrays.sh
# Here we can get fresh raid-array configuration after our changes had applyed.
#hpssascripting -c /tmp/$(date +%Y%m%d-%H%M).hpssascripting.dat

# If we want to apply iLO configuration, we should do it here.
# We remember that after applying new iLO configuration any mounted virutal iso (like this one), will be unmounted!
# So this command should be the last in our script. Or we should add this iso-image again to virtual drive via hponcfg script and then mount it again.
# Directly.
#hponcfg -f /TOOLKIT/hponcfg.ribcl.ilo_basic_config.xml
# Or via script.

exec /bin/bash

