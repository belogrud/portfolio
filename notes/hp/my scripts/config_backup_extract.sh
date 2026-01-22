

# This is a script helping us to restore OS from it backup.

HARD_DRIVE=/dev/sda
HARD_DRIVE_PARTITION=${HARD_DRIVE}1

# Here we create partition table on first hard drive /dev/sda (it depends how we configure raid-array).
# We suppose it will be the root partition.
yes | parted -s -a optimal ${HARD_DRIVE} mklabel GPT mkpart primary ext4 0% 100%

# Just re-read partition table.
sfdisk --re-read ${HARD_DRIVE}

# Here we can just check available size and see type of partition table - we do it as GPT.
parted -l ${HARD_DRIVE}
fdisk -l ${HARD_DRIVE}

# Here we create file-system ext4 with specified UUID.
# We should use UUID that was used this system before. We can get it from previously saved backup /etc/fstab file.
# Here is config for our CentOS 6.4 backup.
#mkfs.ext4 -L root -U e0382008-7673-4653-b4e5-9e0a3ae25c9c ${HARD_DRIVE_PARTITION} 
# Here is config for our RedHat 6.4 backup.
mkfs.ext4 -L root -U d9f5d888-8526-4ccf-950a-dce2f7bf251d ${HARD_DRIVE_PARTITION} 
# Turn off time or count dependent file-system check interval.
tune2fs -c 0 -i 0 ${HARD_DRIVE_PARTITION}

MOUNT_POINT=/mnt/sda1
mkdir -p ${MOUNT_POINT}
mount ${HARD_DRIVE_PARTITION} ${MOUNT_POINT}

# It's just for information.
df -h ${MOUNT_POINT}

# Here is we extracting CentOS 6.4 backup.
#tar --same-owner -xvpzf /mnt/cdrom/data_files/20140213-1053.ds-mon11t.root.fs.tgz -C ${MOUNT_POINT}/
# Here is we extracting RedHat 6.4 backup.
tar --same-owner -xvpzf /mnt/cdrom/data_files/20140205-1454.ds-mon11t.root.fs.tgz -C ${MOUNT_POINT}/

# If backup of OS was created within command like this:
# ssh -t bsv@10.216.43.43 "(sudo -i sh -c 'tar czspf - --one-file-system --exclude=/proc --exclude=/dev --exclude=/sys --exclude=/tmp --exclude=/var/tmp --exclude=/media / | cat - > /tmp/ds-mon11t.root.fs.tgz' )"
# scp bsv@10.216.43.43:/tmp/ds-mon11t.root.fs.tgz /media/sf_share/temp/
#
# Then we should create directoryes that were not backed up.
#
mkdir /${MOUNT_POINT}/proc
chmod 755 /${MOUNT_POINT}/proc
chown root.root /${MOUNT_POINT}/proc

mkdir /${MOUNT_POINT}/dev
chmod 755 /${MOUNT_POINT}/dev
chown root.root /${MOUNT_POINT}/dev

mkdir /${MOUNT_POINT}/sys
chmod 755 /${MOUNT_POINT}/sys
chown root.root /${MOUNT_POINT}/sys

mkdir /${MOUNT_POINT}/tmp
chmod 1777 /${MOUNT_POINT}/tmp
chown root.root /${MOUNT_POINT}/tmp

mkdir /${MOUNT_POINT}/var/tmp
chmod 1777 /${MOUNT_POINT}/var/tmp
chown root.root /${MOUNT_POINT}/var/tmp

mkdir /${MOUNT_POINT}/media
chmod 755 /${MOUNT_POINT}/media
chown root.root /${MOUNT_POINT}/media

# If we have changed boot device, that used in backup, to new one - we should correct it!
# We should correct:
# 1. /boot/grub/grub.conf,
# 2. /etc/mtab,
# 3. /etc/fstab.
# For example if we have changed root drive from /dev/sda2 (here we have /boot and / partition apart) to /dev/sda1 (here we have only one / partition).
#
# Next two lines help us to install Grub boot loader.
# grub-install.unsupported --no-floppy --force --root=/mnt/sda1 /dev/sda
#
# grub-install.unsupported --recheck --root=/mnt/sda1 /dev/sda

# After it we easy can boot server even without cold and hardware reboot!
# We should remember to
# umount ${MOUNT_POINT}


