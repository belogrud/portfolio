#!/bin/bash

## SAMPLE. Change the NFS mount points to match your environment
PROFILE_DIR=${sstk_mount}
PROFILE_TYPE=${sstk_mount_type}
test -n "$sstk_mount_options" && PROFILE_OPTS="-o $sstk_mount_options"

## Internal Variables, do not modify
export TOOLKIT=/TOOLKIT

clear
echo -e "*** Configuring iLO for this server ***"

# Please, remember that after applying new iLO configuration any mounted virutal iso, for example like this one, will be unmounted!
# So this script should be executed later of sequence of other scripts.
# Or we should mount this iso-image again to virtual drive via hponcfg command.
hponcfg -f /TOOLKIT/hponcfg.ribcl.ilo_basic_config.xml

