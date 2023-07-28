#!/bin/sh

if ! mountpoint -q /data/local/tmp/pimount; then
	mount /dev/block/mmcblk1p3 /data/local/tmp/genmount
else
	echo "sd card partition 3 mounted already"
fi




# path to the dir of mounted filesystems root

ROOTFSPATH="/data/local/tmp/genmount"




# Fix setuid issue

busybox mount -o remount,dev,suid /data



busybox mount --bind /dev $ROOTFSPATH/dev

busybox mount --bind /sys $ROOTFSPATH/sys

busybox mount --bind /proc $ROOTFSPATH/proc

busybox mount -t devpts devpts $ROOTFSPATH/dev/pts



# Mount sdcard

#busybox mount --bind /sdcard $ROOTFSPATH/sdcard



# chroot into Ubuntu

busybox chroot $ROOTFSPATH /bin/su - root



# Umount everything after exit

busybox umount $ROOTFSPATH/dev/pts

busybox umount $ROOTFSPATH/dev

busybox umount $ROOTFSPATH/proc

